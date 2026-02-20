
## The short version

In Dart, a normal constructor **must create a new instance of its class**.

A `factory` constructor **does not have to**:

* It can return an existing instance.
* It can return a subclass.
* It can return a cached object.
* It can return something completely different that still matches the declared type.

That’s why `factory` exists. It tells the compiler:
“Trust me. I might not actually build this thing the usual way.”
---

### What is a `factory` Constructor?
- A **factory constructor** is declared with the `factory` keyword.
- It **returns an instance** of the class (or subclass), but **doesn't necessarily create a new object**.
- Syntax: `factory ClassName(params) => /* return object */;`

Unlike regular **generative constructors** (no `factory`), which **always** allocate a **new** instance of **exactly** that class.

### Key Differences
| Feature                  | Generative Constructor                  | Factory Constructor                     |
|--------------------------|-----------------------------------------|-----------------------------------------|
| **Creates new instance?** | Always (allocates memory)              | Optionally (can return existing/cached/subclass/null) |
| **`this` access**        | Full (in init list + body)             | No `this` in body (no "current" instance being built) |
| **Init list**            | Supported (`: field = value`)           | **Not supported**                       |
| **Return type**          | Implicitly the class type              | Must **explicitly return** an instance   |
| **Super chaining**       | Can call `super()`                     | Can call `super()`                      |
| **Redirecting**          | Can redirect to another constructor    | Can redirect to **generative/factory**  |
| **Private**              | Often private (e.g., `_internal()`)    | Common pattern: public factory + private generative |
| **Use case**             | Standard object creation               | Factories, singletons, serialization    |

### Why Use `factory`? (The Need)
Use when a plain generative constructor isn't enough—you need **logic to decide what to return**:
- **Singletons** (one global instance).
- **Caching/pooling** (reuse expensive objects).
- **Subclasses** (return derived type based on input).
- **Parsing** (e.g., `fromJson`, `fromMap`—common in JSON APIs/Flutter).
- **Validation/fallbacks** (return null or default).
- **Immutability enforcement**.

Generative constructors can't do this—they blindly create new objects.

### Examples

#### 1. **Singleton** (only one instance ever)
```dart
class Logger {
  static Logger? _instance;
  final String name;

  // Private generative constructor
  Logger._internal(this.name);

  // Public factory: ensures single instance
  factory Logger(String name) {
    _instance ??= Logger._internal(name);
    return _instance!;
  }
}
```
- Usage: `Logger('app'); Logger('app');` → Same instance both times.

#### 2. **From JSON** (return subclass or validated instance)
```dart
class Shape {
  final String type;
  Shape._internal(this.type);  // Private generative

  factory Shape.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    switch (type) {
      case 'circle':
        return Circle(json['radius'] as double);
      case 'square':
        return Square(json['side'] as double);
      default:
        throw FormatException('Unknown shape: $type');
    }
  }
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius) : super._internal('circle');
}

class Square extends Shape {
  final double side;
  Square(this.side) : super._internal('square');
}
```
- Usage: `Shape.fromJson({'type': 'circle', 'radius': 5.0});` → Returns `Circle` instance.

#### 3. **Caching** (expensive objects)
```dart
class ExpensiveResource {
  final int id;
  static final Map<int, ExpensiveResource> _cache = {};

  ExpensiveResource._(this.id);  // Private

  factory ExpensiveResource(int id) {
    return _cache[id] ??= ExpensiveResource._(id)..load();  // Cache + init
  }

  void load() {
    print('Loading resource $id...');  // Simulate cost
  }
}
```
- Second call with same `id`: Returns cached (no re-load).

#### 4. **Dart Built-ins** (real examples)
- `List.filled(5, 0)` → Factory returning pre-filled list (not new elements each time).
- `DateTime.now()` → Factory using current time.

### Limitations/Rules
- **Must return synchronously** an instance of the class (or subclass).
- **No init list**: Use body logic instead.
- **Can be const**: `factory const MyClass() => const _cached();`
- **Async?** No—use static methods like `static Future<MyClass> createAsync()`.
- **Overridable**: Subclasses can override factories.

### When to Use `factory`
- ✅ Need reuse/caching/singleton.
- ✅ Factory methods (`fromJson`, `parse`).
- ✅ Private constructors + controlled public access.
- ❌ Simple creation → Use generative.


---

## 1. Normal constructor: always creates a new instance

```dart
class Person {
  final String name;

  Person(this.name);
}
```

This **always** creates a new `Person`.
It cannot:

* return `null`
* return a cached instance
* return a subclass
* return a different implementation

It must construct the object before the body runs.

---

## 2. `factory` constructor: controlled creation

Here’s where things get interesting.

```dart
class Logger {
  final String name;

  static final Map<String, Logger> _cache = {};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);
}
```

Why can’t this be a normal constructor?

Because:

* We don’t always create a new `Logger`
* We may return an existing one from `_cache`

A normal constructor is legally obligated to build a fresh object.
A `factory` constructor is free to cheat.

---

## 3. Returning a subclass

Another classic use case:

```dart
abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') {
      return Circle();
    } else {
      return Square();
    }
  }
}

class Circle implements Shape {}
class Square implements Shape {}
```

The caller thinks they’re getting a `Shape`.

What they actually get depends on runtime logic.

A normal constructor cannot return `Circle` when constructing `Shape`.
A `factory` constructor can.

---

## 4. When you *must* use `factory`

You need `factory` if:

* You return something other than `this`
* You return a cached instance
* You perform logic before deciding what to instantiate
* You implement a constructor in an abstract class
* You use redirection with logic

---

## 5. Subtle rule: No `this` inside factory

Because the object doesn’t exist yet.

You can’t do:

```dart
factory Person() {
  print(this); // illegal
}
```

There is no `this`. You haven’t constructed anything.

This is the philosophical difference:

* Normal constructor: object exists, then body runs
* Factory constructor: body runs, then object is returned

---

## 6. Why Dart designers bothered

Dart enforces object initialization very strictly:

* `final` fields must be initialized
* Objects must be fully constructed before use

Without `factory`, constructors would need to allow returning arbitrary objects.
That would break guarantees around initialization.

So Dart splits:

* “Real” constructor → guarantees fresh instance
* `factory` constructor → flexible creation logic

It’s type safety wearing a seatbelt.

---

## Mental Model

Think of it like this:

* **Normal constructor** → “I am building the object.”
* **Factory constructor** → “I am deciding which object you get.”

Creation vs decision.

---

## When NOT to use `factory`

If you just need simple initialization:

```dart
class User {
  final String name;
  User(this.name);
}
```

Do not use `factory` just because it sounds fancy. It’s not a badge of architectural enlightenment.

---

# Why Did Dart Add `factory`?

Because Dart has:

* strict initialization rules
* `final` fields
* sound null safety
* guarantees that generative constructors fully initialize the object before the body runs

Dart wants to preserve these guarantees.

If constructors could arbitrarily return something else, those guarantees would collapse.

So Dart splits construction into two categories:

### Generative constructor

"I promise I am building a fresh instance of this class."

### Factory constructor

"I might do something clever. Brace yourself."

It’s not that other languages don’t have the concept.
They just encode it differently:

| Language | How they do it                            |
| -------- | ----------------------------------------- |
| Java     | Static factory methods                    |
| C#       | Static factory methods                    |
| Python   | Override `__new__`                        |
| JS       | Constructors can return arbitrary objects |
| Dart     | `factory` constructor                     |

Dart basically said:
“Let’s formalize the pattern and make it explicit.”

---

# The real philosophical difference

Languages like JavaScript prioritize flexibility.

Dart prioritizes:

* predictability
* initialization guarantees
* static analysis
* clear intent

So instead of letting constructors silently behave like factories, Dart forces you to mark it.

It’s bureaucracy, but with a purpose.


## Final takeaway

`factory` exists because sometimes construction is not construction.
Sometimes it’s:

* caching
* delegation
* abstraction
* polymorphic return
* instance control

And Dart wants you to explicitly admit when you’re doing that.


# "Renaming" `factory`
If you had the freedom to rename the keyword `factory` in dart, what would you call it to make its purpose more transparent?
You’re basically asking: if we could rename `factory` so it actually says what it does instead of sounding like a 1998 design-pattern seminar, what would it be?

Good. Because “factory” is vague. It suggests “object production facility,” not “this constructor might lie to you.”

If I had freedom, I’d rename it based on what it *actually guarantees*.

---

## 1) `redirecting`

This would be brutally honest.

```dart
redirecting Shape(String type) { ... }
```

It tells you:

> This constructor might redirect somewhere else.

Which is true in most interesting cases:

* return a subtype
* return a cached instance
* forward to a private constructor

It highlights the *delegation* aspect, not the “manufacturing” vibe.

---

## 2) `virtual`

This would emphasize polymorphism.

Normal constructors are concrete.
Factory constructors are… virtual entry points.

```dart
virtual Shape(String type) { ... }
```

It communicates:

> The actual runtime type may differ.

That’s one of the core differences.

---

## 3) `provider`

This leans into the “decides what to give you” semantics.

```dart
provider Logger() { ... }
```

It signals:

> I provide an instance. I don’t promise to build one.

Less sexy, more accurate.

---

## 4) `computed`

This emphasizes that the constructor runs logic first.

```dart
computed User(String name) { ... }
```

It suggests:

> The instance is computed, not directly constructed.

That’s conceptually cleaner than “factory.”

---

## 5) My actual pick: `deferred`

Why?

Because the key semantic difference in Dart is:

* Generative constructor → object exists before body runs.
* Factory constructor → object creation is deferred until you return something.

```dart
deferred Shape(String type) { ... }
```

It conveys:

* No `this` yet
* No object allocated yet
* Construction happens later

That’s mechanically precise.

---

# Why `factory` stuck

Because:

* The pattern was already known
* It aligned with GoF terminology
* It felt familiar to Java developers

But it hides the important semantic distinction:

It’s not about “making objects.”
Every constructor makes objects.

It’s about **deciding which object to return**.

If the keyword were chosen today with null safety and strict initialization in mind, it might be named something closer to:

> “This constructor does not guarantee a fresh instance of this class.”

Which is not exactly catchy.

---

If I had to pick one single word for clarity over tradition:

**`redirecting`**

It’s ugly. It’s honest. It explains itself.

And it would probably have prevented at least half the confusion people have about `factory`.

Language design is compromise. And “factory” is the polite fiction Dart chose.

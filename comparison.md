## Basic concepts

| Concept                  | Dart                                                        | JavaScript                                               | Python                                                       |
| ------------------------ | ----------------------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------ |
| **Comments**             | `// single`<br>`/* multi */`                                | `// single`<br>`/* multi */`                             | `# single`<br>Triple-quoted strings often used as docstrings |
| **Code blocks**          | `{ }` required                                              | `{ }` required                                           | Indentation defines blocks                                   |
| **Line ending**          | `;` required                                                | `;` optional (ASI, chaos engine)                         | No semicolons                                                |
| **Variable declaration** | `var x = 5;`<br>`final x = 5;`<br>`const x = 5;`            | `let x = 5;`<br>`const x = 5;`<br>`var x = 5;`           | `x = 5`                                                      |
| **Typing model**         | Static (inferred)<br>`int x = 5;`                           | Dynamic                                                  | Dynamic                                                      |
| **Null safety**          | Sound null safety<br>`int? x;`                              | `null` and `undefined` free roam                         | `None`                                                       |
| **Strings**              | `'hi'` or `"hi"`<br>Interpolation: `'Hi $name'`             | `'hi'`, `"hi"`, `template`<br>`Hi ${name}`               | `'hi'`, `"hi"`<br>`f"Hi {name}"`                             |
| **Lists**                | `var l = [1,2,3];`                                          | `let l = [1,2,3];`                                       | `l = [1,2,3]`                                                |
| **Maps / Dicts**         | `var m = {'a':1};`                                          | `let m = {a:1};`                                         | `m = {'a':1}`                                                |
| **Imports**              | `import 'dart:math';`                                       | `import { readFile } from 'fs';`                         | `import math`                                                |
| **Optional parameters**  | `void f(int a, [int b = 0]) {}`<br>`void f({int b = 0}) {}` | `function f(a, b = 0) {}`                                | `def f(a, b=0):`                                             |
| **Function declaration** | `int add(int a, int b) { return a+b; }`                     | `function add(a,b){ return a+b; }`                       | `def add(a,b): return a+b`                                   |
| **For loop**             | `for (var i=0; i<5; i++) {}`<br>`for (var x in list) {}`    | `for (let i=0; i<5; i++) {}`<br>`for (let x of list) {}` | `for i in range(5):`<br>`for x in list:`                     |
| **Try–Catch**            | `try { } catch(e) { }`                                      | `try { } catch(e) { }`                                   | `try: ... except Exception as e:`                            |
| **Main entry point**     | `void main() {}`                                            | No required main (script top-level)                      | `if __name__ == "__main__":`                                 |
| **Classes**              | `class A { int x; A(this.x); }`                             | `class A { constructor(x){ this.x=x } }`                 | `class A:`<br>`    def __init__(self,x): self.x=x`           |
| **Async support**        | `Future`, `async/await`<br>`Future f() async {}`            | `Promise`, `async/await`                                 | `async def f():`                                             |
| **Concurrency model**    | Isolates (no shared memory)<br>`Isolate.spawn()`            | Event loop (single-threaded + workers)                   | Threads, multiprocessing, `asyncio`                          |


### 🔹 Operators (Equality & Identity)

Because this is where JavaScript starts gaslighting people.

| Concept  | Dart             | JavaScript                   | Python       |
| -------- | ---------------- | ---------------------------- | ------------ |
| Equality | `==` (value)     | `==` (loose), `===` (strict) | `==` (value) |
| Identity | `identical(a,b)` | `Object.is(a,b)`             | `is`         |

---

### 🔹 Type Annotation Syntax

Especially relevant if you care about static guarantees.

| Concept        | Dart         | JavaScript           | Python       |
| -------------- | ------------ | -------------------- | ------------ |
| Explicit types | `int x = 5;` | TypeScript only      | `x: int = 5` |
| Generics       | `List<int>`  | `Array<number>` (TS) | `list[int]`  |

Note: JS itself is dynamically typed. TypeScript is the grown-up sibling.

---

### 🔹 Lambdas / Anonymous Functions

| Concept | Dart         | JavaScript   | Python          |
| ------- | ------------ | ------------ | --------------- |
| Lambda  | `(x) => x+1` | `(x) => x+1` | `lambda x: x+1` |

Python’s lambda is intentionally crippled. Because Guido said so.

---

### 🔹 Pattern Matching

Modern language flex.

| Concept       | Dart                                                | JavaScript                          | Python             |
| ------------- | --------------------------------------------------- | ----------------------------------- | ------------------ |
| Pattern match | `switch (x) { case 1: }` (enhanced patterns in 3.x) | `switch` (no real pattern matching) | `match x:` (3.10+) |

---

### 🔹 Error Handling Extensions

| Concept          | Dart                                | JavaScript                   | Python                       |
| ---------------- | ----------------------------------- | ---------------------------- | ---------------------------- |
| Custom exception | `class MyE implements Exception {}` | `class MyE extends Error {}` | `class MyE(Exception): pass` |

---

### 🔹 Modules & Namespacing

| Concept | Dart                  | JavaScript        | Python                                |
| ------- | --------------------- | ----------------- | ------------------------------------- |
| Export  | `export 'file.dart';` | `export { foo };` | Everything exported unless `_private` |

---

### 🔹 Mutability

| Concept            | Dart              | JavaScript             | Python          |
| ------------------ | ----------------- | ---------------------- | --------------- |
| Immutable variable | `final` / `const` | `const` (binding only) | Convention only |
| Immutable list     | `const [1,2]`     | `Object.freeze()`      | `tuple`         |

---

### 🔹 Interfaces / Abstract Types

| Concept   | Dart               | JavaScript           | Python              |
| --------- | ------------------ | -------------------- | ------------------- |
| Interface | Implicit via class | Not native (TS only) | Duck typing / `ABC` |

---

### 🔹 Visibility Modifiers

| Concept | Dart                     | JavaScript               | Python              |
| ------- | ------------------------ | ------------------------ | ------------------- |
| Private | `_var` (library-private) | `#field` (class private) | `_var` (convention) |

---

### 🔹 Memory Model / Execution

| Concept          | Dart       | JavaScript      | Python          |
| ---------------- | ---------- | --------------- | --------------- |
| Runtime model    | AOT/JIT VM | V8 / browser VM | CPython (GIL)   |
| True parallelism | Isolates   | Web Workers     | Multiprocessing |

As a computational biologist, the **GIL** is the villain in your life story. Dart’s isolate model is actually cleaner than Python’s threading situation. JS avoids the problem by pretending threads don’t exist until they absolutely must.

---

### 🔹 Tooling Integration (Cheatsheet Gold)

| Concept         | Dart          | JavaScript | Python  |
| --------------- | ------------- | ---------- | ------- |
| Package manager | `pub`         | `npm`      | `pip`   |
| Formatting tool | `dart format` | `prettier` | `black` |

---

## Advanced

| Feature                              | Dart                           | JavaScript                           | Python                                               |
| ------------------------------------ | ------------------------------ | ------------------------------------ | ---------------------------------------------------- |
| **Ternary / conditional expression** | `cond ? a : b`                 | `cond ? a : b`                       | `a if cond else b`                                   |
| **String interpolation**             | `'Hello $name'`                | `` `Hello ${name}` ``                | `f"Hello {name}"`                                    |
| **Null-coalescing / default value**  | `a ?? b`                       | `a ?? b`                             | `a or b` *(not strict null-only)*                    |
| **Optional chaining**                | `obj?.field`                   | `obj?.field`                         | `getattr(obj, "field", None)` or `obj and obj.field` |
| **Arrow / concise function**         | `(x) => x + 1`                 | `(x) => x + 1`                       | `lambda x: x + 1`                                    |
| **Collection if (inline condition)** | `[if (x>0) x]`                 | No native                            | `[x for x in xs if x>0]`                             |
| **Collection for (inline loop)**     | `[for (var x in xs) x*2]`      | No native                            | `[x*2 for x in xs]`                                  |
| **Spread operator**                  | `[...list]`                    | `[...array]`                         | `[*list]`                                            |
| **Getters**                          | `int get x => _x;`             | `get x() {}`                         | `@property`                                          |
| **Setters**                          | `set x(int v) {}`              | `set x(v) {}`                        | `@x.setter`                                          |
| **Cascades (method chaining sugar)** | `obj..method()..other()`       | Not built-in                         | Not built-in                                         |
| **Extension methods**                | `extension MyExt on String {}` | Not native (modify prototype, risky) | Monkey patching (also risky)                         |
| **Enums**                            | `enum Color { red, blue }`     | `Object.freeze({...})` or TS `enum`  | `from enum import Enum`                              |
| **Records (structural tuples)**      | `(int, String)`                | Array or object literal              | `tuple`                                              |
| **Pattern matching / destructuring** | `switch` with patterns         | Object/array destructuring           | `match` + unpacking                                  |
| **Destructuring assignment**         | `(a, b) = (1, 2);`             | `const [a,b] = arr;`                 | `a, b = (1, 2)`                                      |
| **Generics**                         | `List<int>`                    | TS only                              | `list[int]`                                          |
| **Mixins**                           | `class A with B {}`            | Not native                           | Multiple inheritance                                 |


## Architectural concept
| Concept                      | Dart                     | JavaScript                | Python                              |
| ---------------------------- | ------------------------ | ------------------------- | ----------------------------------- |
| **Concurrency model**        | Isolates (no shared mem) | Event loop + Workers      | Threads, multiprocessing, `asyncio` |
| **True parallelism**         | Yes (isolates)           | Workers                   | Multiprocessing                     |
| **Runtime**                  | Dart VM, AOT/JIT         | V8 / browser VM           | CPython (GIL)                       |
| **Compilation target**       | Native, JS               | Browser, Node             | Bytecode (C impl)                   |
| **Package manager**          | `pub`                    | `npm`                     | `pip`                               |
| **Formatter**                | `dart format`            | `prettier`                | `black`                             |
| **Testing**                  | `package:test`           | `jest`, etc.              | `pytest`                            |
| **REPL**                     | `dart run` / DartPad     | Node REPL                 | `python` shell                      |

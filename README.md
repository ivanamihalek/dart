You’re building in a project literally named flutter / dart and now you’re asking what Flutter is. Bold. I respect the chaos.

Here’s the clean version.

## Flutter

Flutter is a UI framework made by Google. It lets you build apps for:

* iOS
* Android
* Web
* Desktop

…using a single codebase. One set of source files, multiple platforms. Developers love that. Product managers love it more.

Flutter does **not** use native UI components. It renders everything itself using its own high-performance rendering engine (Skia under the hood), which is why apps look consistent across platforms.

---

## Dart

Dart is the programming language Flutter uses.

Google also made Dart. It’s:

* Object-oriented
* Garbage-collected
* Compiled ahead-of-time for production
* JIT-compiled for fast development hot reload

In practice: Dart is the language, Flutter is the framework.

---

## Relationship in one sentence

Dart is the engine; Flutter is the car.

Or more precisely:
You write **Dart code**, Flutter turns it into **UI and app behavior**.

---

## Why Dart specifically?

Flutter needed a language that:

* Compiles fast
* Has predictable performance
* Supports hot reload
* Is modern but simple

Dart checked those boxes. Also, Google controls both, which avoids the “three committees arguing” problem.

---

## Very short mental model

| Layer    | What it is                      |
| -------- | ------------------------------- |
| Dart     | Programming language            |
| Flutter  | UI framework written in Dart    |
| Your App | Dart code using Flutter widgets |

You don’t use Flutter without Dart. You technically can use Dart without Flutter, but most people only remember Dart because Flutter made it relevant.

Now go build something pretty. Or at least something that doesn’t crash on launch.

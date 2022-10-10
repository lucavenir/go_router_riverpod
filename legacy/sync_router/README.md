# sync_router

This example uses **synchronous redirects** while exploiting a `ChangeNotifier` as a `Listenable` object inside our Router definition.
**Dependencies**:
  - GoRouter v5
  - Riverpod v2

## Is this approach advised?
This example just works. It has its downside (see below), but it correctly exploits GoRouter's API, while still maintaining Riverpod's advantages.

**Advantages:**
  - `RouterNotifier` centralizes all the logic, which can be highly customizable
  - `ref.listen` allows to scale reactive dependencies linearly
  - No side effects

**Disadvantages:**
  - `ChangeNotifier` is discouraged within Riverpod (see https://riverpod.dev/docs/concepts/providers/#different-types-of-providers), but it's the closest class we have at our disposal that implements the `Listenable` interface (as required by `GoRouter`'s `refreshListenable` parameter);
  - A `ref` object _must_ be piped down to `ChangeNotifier`: this might be undesirable, as this causes a small caveat (see below)

### Short explanation
In this example we directly implement a `ChangeNotifier`. In its constructor method, we exploit `ref.listen` to add reactive dependencies through `notifyListeners`.

**Caveat**
Reactive dependencies must be defined _only_ within the constructor and _only_ through `ref.listen`.

This is key to avoid unnecessary rebuilds: when writing logic inside our Notifier, we might want to use `ref.read` to read providers, _and avoid `ref.watch`_.

GoRouter is already aware of state changes through `refreshListenable`: we don't want to trigger a rebuild of the surrounding provider.

_Simply put - this is not clean code - this works because of side effects._

## Getting started

First, read the code:
  - 'lib/main.dart' has UI elements
  - 'lib/router.dart' has the routing logic
  - 'lib/auth.dart' has the auth logic

Most of the actions are mocked, here.
Then, run:

`flutter test`
`flutter run`

Enjoy!

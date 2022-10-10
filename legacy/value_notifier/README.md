# value_notifier

[WARN: LEGACY CODE]
This example uses a `ValueNotifier` as a `Listenable` object inside our Router definition.
**Dependencies**:
  - GoRouter v4
  - Riverpod v1

## Is this approach advised?
It turns out this approach isn't very "scalable" and it's not clean.

### Short explanation
In this example we build a `Listenable` object through `ValueNotifier`, which - in the end - is just a `ChangeNotifier` that internally calls `notifyListeners` when such value changes; this allows us to implement our custom logic and make the router react to external changes

This implementation has low readability: it's discouraged to introduce code that works because of side effects.

**Side effects? What?**

Here, ValueNotifier exposes a _useless_ value (no one is actually reading or using it); furthermore, we are forced to write onto the listenable to trigger rebuilds.
Shortly, this is a workaround, which doesn't makes much sense when other options are available

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

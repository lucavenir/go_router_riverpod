# refresh_stream

[WARN: LEGACY CODE]
Since GoRouer v5, `GoRouterRefreshStream` is removed from the API. This example is here just to give a workaround for legacy code bases: this example makes the transition towards v5 smooth; it re-creates  `GoRouterRefreshStream` as a `Listenable` object inside our Router definition.

**Dependencies**:
  - GoRouter v5
  - Riverpod v1

## Is this approach advised?
**DO NOT** USE THIS APPROACH IF POSSIBLE. This is just for migration purposes. Also, Riverpod exists to avoid handling streams, so...

### Short explanation
If you're still here, then here's a refresher. In GoRouter <\v4, refreshListenable accepted a `RefreshStream`, and it allowed the user to define a `GoRouterRefreshStream`, for simple `Stream` implementations.

Nowadays, GoRouter >v5 doesn't expose a GoRouterRefreshStream class anymore. The migration guide simply suggests to just reimplement that class: we can do that in a few LOC; at the end of the day, a GoRouterRefreshStream is just a ChangeNotifier with a stream subscription in it, which simply calls `notifyListeners()` whenever the stream gives a new value.

**Why is this discouraged?**

Besides the change in the API with GoRouter v5, it should be considered that, when compared to other approaches, with this implementation:
  - it is slightly harder to manage different providers states
  - it is harder to customize logic through `listen`
  - you don't even save some LOC (it's as verbose as ever)

_Simply put - skip this example if you're not migrating code in legacy codebases_

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

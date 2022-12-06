# code_gen

This a slightly more complicated example, featuring:
- Riverpod's new [AsyncNotifier] (Riverpod v2)
- GoRouter's asynchronous redirect API
- A slightly more complicated and asynchronous authentication model
- A basic authentication model
- An intermediate splash page
- Some basic persistence API usage
- **!** several code generation tools, such as `riverpod_annotation`, `go_router_builder` and `freezed`

This is the "main" example of this repo; its objective is to define some best practices when using Riverpod + GoRouter (as opposed to other examples, which are just community-driven).

**Note**. The tests are _intentionally_ not being updated and the route-level redirect is missing. We're waiting on [this PR](https://github.com/flutter/packages/pull/2848) before completing this example. The rest of the example is fine, tho.

**Nonetheless**:
  - _This has to be considered as a "best effort" example that aims to integrate as much best practices as possible_;
  - _Indeed, we can all agree that there is no magical silver bullet that fits in every possible use case: use with caution._.

**Dependencies**:
  - GoRouter v5 (and its annotation)
  - Riverpod v2 (and its annotation)
  - Freezed v2
  - SharedPreferences v2

## Getting started

First, read the code:
  - 'lib/main.dart' has UI elements
  - 'lib/router' has the routing logic
  - 'lib/entities.dart' has domain logic

Most of the actions are mocked, here.
Then, run:

`flutter pub run build_runner watch -d`
`flutter test`
`flutter run`

Enjoy!

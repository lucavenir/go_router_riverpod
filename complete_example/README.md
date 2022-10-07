# complete_example

This a slightly more complicated example, featuring:
- Riverpod's new [AsyncNotifier] (Riverpod v2)
- GoRouter's asynchronous redirect API
- A slightly more complicated and asynchronous auth model
- An intermediate splash page
- Some basic persistence API usage

This is the "main" example of this repo; its objective is to define some best practices when using Riverpod + GoRouter (as opposed to other examples, which are just community-driven).

**Nonetheless**:
  - _This is a work in progress example, stay tuned_;
  - _No one here has the arrogance to say that this simple example will be "perfect", one day_;
  - _We can all agree that there is no magical silver bullet that fits in every possible use case._.

**Dependencies**:
  - GoRouter v5
  - Riverpod v2
  - SharedPreferences v2

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

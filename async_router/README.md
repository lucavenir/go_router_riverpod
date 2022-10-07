# async_router

This example uses **asynchronous redirects** while exploiting a `ChangeNotifier` as a `Listenable` object inside our Router definition.
**Dependencies**:
  - GoRouter v5
  - Riverpod v2

## What is this approach?
This example is identical to the "synchronous" one, but with asynchronous redirects in the `redirect` method.

**Differences:**
  - In the redirect method, a "loginWithToken" is attempted to try and recover an auth state with local storage information

**Advantages / Disadvantages:**
  - The same as the synchronous example

_I don't personally like how this implementation ended up to be_

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

# alternative_example

## Special thanks
**BIG THANKS** to @creativecreatorormaybenot for introducing this clever, yet simple way of handling GoRouter with Riverpod.

In this simple example, we exploit Riverpod _and_ Flutter simplicities! With no side effects, no `ChangeNotifier`, no weird `ref` piping, we can handle our router with a few LOC.

### The main trick
All of our legacy exmples included workarounds to avoid unnecessary rebuilds at the router level. The simple trick here is to use a `GlobalKey` on top of our router: this tells the Framework not to rebuild the whole widget tree.

At the same time, our router is rebuilt, with no side effects or special caring about `ref`s usage. This enables the developer to just write - declaratively - all the dependencies needed _directly in the Provider_, i.e. to use Riverpod how it is supposed to be used.

## Is this approach advised?
Absolutely; at this very moment I can't find any downsides to this approach

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

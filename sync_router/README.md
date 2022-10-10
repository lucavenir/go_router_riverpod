# sync_router

## Special thanks
**BIG THANKS** to @creativecreatorormaybenot for introducing this clever, yet simple way of handling GoRouter with Riverpod.

This example should be considered the go-to solution if we want to exploit Riverpod _and_ Flutter simplicities!

This example works with no side effects, no `ChangeNotifier`, no weird `ref` piping; we just write handle our router declaratively, with a few LOC. Reactive dependencies are directly written in the Router's Provider, while no unnecessary rebuilds are being performed.

### The main trick
All of our legacy exmples included workarounds to avoid unnecessary rebuilds at the top of our Widget Tree (where the router lies). The simple trick here is to use a `GlobalKey` on top of our router: this tells the Framework not to rebuild the whole widget tree.

At the same time, our router is rebuilt, with no side effects or special caring about `ref`s usage. This enables the developer to just write - declaratively - all the dependencies needed _directly in the Provider_, i.e. to use Riverpod how it is supposed to be used.

### Is this approach advised?
Absolutely; at this very moment I can't find any downsides to this approach. But if you find any, you're welcome to open issues or PR.

### Wait, I do see unnecessary rebuilds
Are you _absolutely sure_? Please check [this discussion](https://github.com/flutter/flutter/issues/112915#issuecomment-1269053217) first. If you're still convinced this approach doesn't work out in the end, you're welcome to open an issue or a PR.

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

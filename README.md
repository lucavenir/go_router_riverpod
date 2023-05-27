# GoRouter + Riverpod integration

This repo contains a simple example on how to integrate [GoRouter] and [Riverpod] altogether.
There's also another example about GoRouter + Riverpod + **Firebase** integrations.

This example is community driven and strives to represent the "best" solution we've found.

## The example, TLDR
Here's what happens when you run the app:
- There's a simple mock of a login. Tap to login (mock).
- The authentication state is persisted with sharedPrefs. 
- Afterwards, your _authorization_ is checked, and you get redirected based on that (mock).
- Based on your role, you get to see three different pages.
- On two out of the three pages, an async result is displayed, there (mock).
- Finally, when the async result is ready, you're free to tap an element to see its details.

## Special Thanks
**BIG THANKS** to...
- @[anyone] who has ever contributed in here
- @[the whole riverpod discord community] for the discussions we've enjoyed around this problem
- @rrousselGit for creating this _great_ ecosystem!

## Is there something _without_ codegen or / and hooks?

No, not at this moment in time. PRs are welcome, but chances are that I'll maintain the codegen and firebase (based on codegen) examples only.

## What about _older_ examples, with legacy versions of the aforementioned libraries?

For the same reason above, I stopped maintaining legacy integrations. It just doesn't makes sense, since there's a potentially unlimited amount of combinations to take care of.

Use `git`. You'll find _a lot_ of folders full of old examples.

## Something feels off....
Please consider starring this mini-repo if you found it useful.
Also please consider opening an issue or a PR if you think you can contribute in here. Don't be shy!

If you didn't, or if you want to contribute in any way, a discussion about improving this example can be found [here].

[Riverpod]: https://github.com/rrousselGit/river_pod
[GoRouter]: https://github.com/flutter/packages/tree/main/packages/go_router
[here]: https://github.com/rrousselGit/riverpod/discussions/1357

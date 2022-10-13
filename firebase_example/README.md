# firebase_example

Here, we want to showcase a possible integration of GoRouter + Riverpod + Firebase SDK.

## Usage Warning
This example **is not** tested. Firebase has to be configured with its Project, and this makes it hard to test without a real project. I don't want to open a Firebase Project "open to everyone", at the moment.

Anyways, keep in mind that:
  - Your project probably has its `lib/firebase_options.dart` file: just ignore the dummy one you find in this repo;
  - The written logic in here _should_ be OK. That's how I usually implement stuff into real-life projects with Firebase;
  - You're welcome to implement your own tests by copying the ones in other folders and try them out.

## Further notes
You'll notice that no `AsycNotifier` nor `StateNotifier` is being used here. I find it convenient to just listen to FirebaseAuth's `authStateChange`'s `Stream`. In this example, simplicity wins.

## Getting started

First, read the code:
  - 'lib/main.dart' has UI elements
  - 'lib/router.dart' has the routing logic
  - 'lib/auth.dart' has the auth logic

You can ignore `lib/firebase_options.dart`.

Most of the actions are mocked, here.
Then, run:

`flutter run`

Enjoy!

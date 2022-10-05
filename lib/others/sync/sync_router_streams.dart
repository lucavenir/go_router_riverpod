import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../models/user.dart';

// ** WARNING **
// THIS EXAMPLE IS TO BE CONSIDERED ** LEGACY CODE **
// Since GoRouer v5, `GoRouterRefreshStream` is removed from the API.
// This example is here just to give a workaround for legacy code bases
// DON'T USE THIS APPROACH IF POSSIBLE
//
// If you're still here, then here's a refresher.
// In GoRouter <v4, refreshListenable accepted a `RefreshStream`, while exposing
// a `GoRouterRefreshStream`, for simple `Stream` interactions.
// GoRouter >v5 doesn't expose a GoRouterRefreshStream class anymore.
// The migration guide simply suggests to just reimplement that class.
// We can do that in a few LOC. In the end, a GoRouterRefreshStream is just
// a ChangeNotifier with a stream subscription in it, which simply calls
// `notifyListeners()` whenever the stream gives a new value.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// Now, with the above class, your legacy code can cohexist with GoRouter v5.
// In my opinion, though, you should migrate to another approach ASAP.

// Consider that with this approach:
//   - It's slightly harder to manage different providers states.
//   - It's harder to customize the `listen` behavior.
//   - Is doesn't even save you a few LOC (it's as verbose as ever)
final streamsRouterProvider = Provider<GoRouter>((ref) {
  final listenable = GoRouterRefreshStream(
    ref.watch(authProvider.notifier).stream,
  );

  ref.onDispose(() {
    listenable.dispose();
  });

  return GoRouter(
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // We want to READ the state, here.
      // GoRouter is already aware of state changes through `refreshListenable`
      // We don't want to trigger a rebuild of this provider.
      final user = ref.read(authProvider);

      // From here we can use the state and implement our custom logic
      final areWeLoggingIn = state.location == LoginPage.routeLocation;

      if (user == null) {
        // We're not logged in
        // So, IF we aren't in the login page, go there.
        return areWeLoggingIn ? null : LoginPage.routeLocation;
      }
      // We're logged in

      // At this point, IF we're in the login page, go to the home page
      if (areWeLoggingIn) return HomePage.routeLocation;

      // There's no need for a redirect at this point.
      return null;
    },
    // This is crucial to make the router work with Riverpod.
    refreshListenable: listenable,
    routes: [
      GoRoute(
        name: HomePage.routeName,
        path: HomePage.routeLocation,
        builder: (context, _) => const HomePage(),
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: LoginPage.routeLocation,
        builder: (context, _) => const LoginPage(),
      ),
    ],
  );
});

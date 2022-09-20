import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../user.dart';

// ** WARNING **
// SINCE GOROUTER >v5 THIS EXAMPLE IS TO BE CONSIDERED ** LEGACY CODE **
//
// THE FOLLOWING IS JUST A WORKAROUND FOR LEGACY CODEBASES THAT STILL
// USE THIS APPROACH.
//
// ** DON'T USE THIS APPROACH IF POSSIBLE. **
//
// With GoRouter <v4 we wanted to exploit GoRouter's `RefreshStream`,
// as it was made exactly for this purpose.
//
// GoRouter >v5 doesn't expose a GoRouterRefreshStream class anymore.
// The migration guide simply suggests to just reimplement that class.
//
// We can do that in a few LOC.
// In the end, a GoRouterRefreshStream is just a ChangeNotifier with a stream
// in it that calls `notifyListeners()` whenever the state changes.
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
final router2Provider = Provider<GoRouter>((ref) {
  final listenable = GoRouterRefreshStream(
    ref.watch(userProvider.notifier).stream,
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
      final user = ref.read(userProvider);

      // From here we can use the state and implement our custom logic
      final areWeLoggingIn = state.location == '/login';

      if (user == null) {
        // We're not logged in
        // So, IF we aren't in the login page, go there.
        return areWeLoggingIn ? null : '/login';
      }
      // We're logged in

      // At this point, IF we're in the login page, go to the home page
      if (areWeLoggingIn) return '/';

      // There's no need for a redirect at this point.
      return null;
    },
    // This is crucial to make the router work with Riverpod.
    refreshListenable: listenable,
    routes: [
      GoRoute(
        name: "home",
        path: '/',
        builder: (context, _) => const HomePage(),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        builder: (context, _) => const LoginPage(),
      ),
    ],
  );
});

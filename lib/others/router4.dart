import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../user.dart';

// This version exploits GoRouter's new APIs, allowing the redirects to be...
// ... ASYNCHRONOUS!!
// This is big news and you'll see why in a few LOC.

final router4Provider = Provider<GoRouter>((ref) {
  final router = AsyncRouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true, // For demo purposes
    refreshListenable: router, // This notifiies `GoRouter` for refresh events
    redirect: router._redirect, // All the logic is centralized here
    routes: router._routes, // All the routes can be found there
  );
});

/// This approach is a copy of Router1, but allows for asynchronous redirects.
class AsyncRouterNotifier extends ChangeNotifier {
  final Ref _ref;

  AsyncRouterNotifier(this._ref) {
    _ref.listen<User?>(
      userProvider,
      (_, __) => notifyListeners(),
    );
  }

  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    final user = _ref.read(userProvider); // Remember to use ref.read, here.

    if (user == null) {
      // Here, we're not logged in

      // Therefore, no redirect needed if we're inserting credentials.
      if (state.location == '/login') return null;

      // Here, we're not seeing the login page, but we're not authenticated yet.
      try {
        // Therefore we can still try to recover some auth state from our local
        await _ref.read(userProvider.notifier).loginWithToken();

        // If the attempts succeeds, the current page can be shown
        return null;
      } on UnauthorizedException catch (err) {
        // This means that the attempt failed: handle this, somehow
        print(err); // MOCK

        // Then, redirect to login. Further customization can be done.
        return '/login';
      } on LogoutException catch (_) {
        // This means that no attempt has been made: we've logged out!
        // Which means we just need to redirect to the login..

        return '/login';
      }
    }
    // Here, we're logged in

    // At this point, If we're still in the login page, go to the home page
    if (state.location == '/login') return '/';

    // There's no need for a redirect at this point.
    return null;
  }

  List<GoRoute> get _routes => [
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
      ];
}

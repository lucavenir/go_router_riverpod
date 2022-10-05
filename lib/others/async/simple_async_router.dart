import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../models/user.dart';

// This a first Asynchronous redirect example.
// Asynchronous tasks here are performed in the `redirect` method
// I personally don't like this method. It doesn't feel like it scales well:
// See the "complex async router" example.
final asyncRouterProvider = Provider<GoRouter>((ref) {
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
  ProviderSubscription? subscription;

  AsyncRouterNotifier(this._ref) {
    subscription = _ref.listen<User?>(
      authProvider,
      (_, __) => notifyListeners(),
    );
    _ref.onDispose(() {
      subscription?.close();
    });
  }

  @override
  void dispose() {
    subscription?.close();
    super.dispose();
  }

  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    final user = _ref.read(authProvider); // Remember to use ref.read, here.

    if (user == null) {
      // Here, we're not logged in

      // Therefore, no redirect needed if we're inserting credentials.
      if (state.location == LoginPage.routeLocation) return null;

      // Here, we're not seeing the login page, but we're not authenticated yet.
      try {
        // Therefore we can still try to recover some auth state from our local
        await _ref.read(authProvider.notifier).loginWithToken();

        // If the attempts succeeds, the current page can be shown
        return null;
      } on UnauthorizedException catch (err) {
        // This means that the attempt failed: handle this, somehow
        print(err); // MOCK

        // Then, redirect to login. Further customization can be done.
        return LoginPage.routeLocation;
      } on LogoutException catch (_) {
        // This means that no attempt has been made: we've logged out!
        // Which means we just need to redirect to the login..

        return LoginPage.routeLocation;
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
          name: HomePage.routeName,
          path: HomePage.routeLocation,
          builder: (context, _) => const HomePage(),
        ),
        GoRoute(
          name: LoginPage.routeName,
          path: LoginPage.routeLocation,
          builder: (context, _) => const LoginPage(),
        ),
      ];
}

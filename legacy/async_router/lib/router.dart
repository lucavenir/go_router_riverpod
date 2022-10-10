import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import 'auth.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = AsyncRouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    initialLocation: HomePage.routeLocation,
    redirect: router._redirect,
    routes: router._routes,
  );
});

class AsyncRouterNotifier extends ChangeNotifier {
  final Ref _ref;
  ProviderSubscription? subscription;

  AsyncRouterNotifier(this._ref) {
    subscription = _ref.listen<bool>(
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
    final isAuth = _ref.read(authProvider);

    if (!isAuth) {
      if (state.location == LoginPage.routeLocation) return null;

      try {
        // Try to recover some auth state from our local storage
        await _ref.read(authProvider.notifier).loginWithToken();

        // If the attempts succeeds, the current page can be shown
        return null;
      } catch (_, __) {
        // Else, redirect to the login page
        return LoginPage.routeLocation;
      }
    }

    if (state.location == LoginPage.routeLocation) {
      return HomePage.routeLocation;
    }

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

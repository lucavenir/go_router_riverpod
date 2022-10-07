import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth.dart';
import 'main.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: SplashPage.routeLocation,
    refreshListenable: router,
    routes: router._routes,
    redirect: router._redirectLogic,
  );
});

class RouterNotifier extends ChangeNotifier {
  ProviderSubscription? unsub;
  RouterNotifier(this.ref) {
    unsub = ref.listen(authProvider, (_, __) {
      notifyListeners();
    });
    ref.onDispose(() {
      unsub?.close();
    });
  }
  final Ref ref;

  @override
  void dispose() {
    unsub?.close();
    super.dispose();
  }

  FutureOr<String?> _redirectLogic(BuildContext context, GoRouterState state) {
    // If our async state is loading, don't perform redirects, yet
    if (ref.read(authProvider.notifier).isLoading) return null;

    final isAuth = ref.read(authProvider.notifier).isAuthenticated;

    final isSplash = state.location == SplashPage.routeLocation;
    if (isSplash) {
      return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
    }

    final isLoggingIn = state.location == LoginPage.routeLocation;
    if (isLoggingIn) return isAuth ? HomePage.routeLocation : null;

    return isAuth ? null : SplashPage.routeLocation;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashPage.routeLocation,
          name: SplashPage.routeName,
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: HomePage.routeLocation,
          name: HomePage.routeName,
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: LoginPage.routeLocation,
          name: LoginPage.routeName,
          builder: (context, state) {
            return const LoginPage();
          },
        ),
      ];
}

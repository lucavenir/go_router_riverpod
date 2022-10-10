import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth.dart';
import 'main.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomePage.routeLocation,
    refreshListenable: router,
    redirect: router._redirectLogic, // All the logic is centralized there
    routes: router._routes, // All the routes can be found there
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  ProviderSubscription? subscription;

  RouterNotifier(this._ref) {
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

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final isAuth = _ref.read(authProvider);

    final areWeLoggingIn = state.location == LoginPage.routeLocation;

    if (!isAuth) return areWeLoggingIn ? null : LoginPage.routeLocation;

    if (areWeLoggingIn) return HomePage.routeLocation;

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

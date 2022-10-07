import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import 'auth.dart';

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

final routerProvider = Provider<GoRouter>((ref) {
  final listenable = GoRouterRefreshStream(
    ref.watch(authProvider.notifier).stream,
  );

  ref.onDispose(listenable.dispose);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: listenable,
    initialLocation: HomePage.routeLocation,
    redirect: (context, state) {
      final isAuth = ref.read(authProvider);

      final areWeLoggingIn = state.location == LoginPage.routeLocation;

      if (!isAuth) return areWeLoggingIn ? null : LoginPage.routeLocation;

      if (areWeLoggingIn) return HomePage.routeLocation;

      return null;
    },
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

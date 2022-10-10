import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth.dart';
import 'main.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final isAuth = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
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
    ], // All the routes can be found there
  );
});

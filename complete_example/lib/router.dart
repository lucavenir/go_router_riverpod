import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth.dart';
import 'main.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = FutureProvider<GoRouter>((ref) async {
  final isAuth = await ref.watch(
    authProvider.selectAsync((value) => value != null),
  );

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: SplashPage.routeLocation,
    routes: [
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
    ],
    redirect: (context, state) {
      // If our async state is loading, don't perform redirects, yet
      if (isAuth == null) return null;

      final isSplash = state.location == SplashPage.routeLocation;
      if (isSplash) {
        return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
      }

      final isLoggingIn = state.location == LoginPage.routeLocation;
      if (isLoggingIn) return isAuth ? HomePage.routeLocation : null;

      return isAuth ? null : SplashPage.routeLocation;
    },
  );
});

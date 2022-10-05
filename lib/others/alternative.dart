import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../models/user.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// Caches and Exposes a [GoRouter]
final alternativeProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(authProvider);
  print("I have been rebuilt!");

  return GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true, // For demo purposes
    redirect: ((context, state) {
      print("I have been re-exectued!");
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
    }),
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

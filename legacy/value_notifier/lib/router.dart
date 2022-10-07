import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth.dart';
import 'main.dart';

// Yet another possible approach.
//
final routerProvider = Provider<GoRouter>((ref) {
  final listenable = ValueNotifier<bool>(false);

  final unsubscribe = ref.listen<bool>(authProvider, (oldUser, next) {
    // This is just to trigger `notifyListeners` within the `ValueNotifier`
    listenable.value = !listenable.value;
  });
  ref.onDispose(unsubscribe);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: listenable,
    initialLocation: HomePage.routeLocation,
    redirect: (state) {
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

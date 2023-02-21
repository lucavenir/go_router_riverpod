import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/auth.dart';
import 'routes.dart';

part 'router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

/// This simple provider caches our GoRouter.
@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: SplashRoute.path,
    routes: $appRoutes,
    redirect: _redirect,
  );
}

/// Redirects the user when our authentication changes
FutureOr<String?> _redirect(BuildContext context, GoRouterState state) async {
  print("Hello from ${state.location}");
  final auth = await ProviderScope.containerOf(context).read(
    authNotifierProvider.future,
  );
  print("Auth state: $auth");

  final isAuth = auth.map(signedIn: (_) => true, signedOut: (_) => false);

  final isSplash = state.location == SplashRoute.path;

  if (isSplash) return isAuth ? HomeRoute.path : LoginRoute.path;

  final isLoggingIn = state.location == LoginRoute.path;
  if (isLoggingIn) return isAuth ? HomeRoute.path : null;

  return isAuth ? null : SplashRoute.path;
}

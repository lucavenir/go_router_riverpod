import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';
import '../state/permissions.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  routes: [
    TypedGoRoute<AdminRoute>(path: AdminRoute.path),
    TypedGoRoute<UserRoute>(path: UserRoute.path),
    TypedGoRoute<GuestRoute>(path: GuestRoute.path),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    if (state.location == HomeRoute.path) return null;

    final userRole = ProviderScope.containerOf(context).read(
      permissionsProvider.select((value) => value.valueOrNull),
    );

    final redirectTo = userRole?.maybeMap(
      admin: (_) => null,
      user: (_) {
        if (state.location == AdminRoute.path) return HomeRoute.path;
        return null;
      },
      orElse: () {
        if (state.location != HomeRoute.path) return HomeRoute.path;
        return null;
      },
    );

    return redirectTo;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

class AdminRoute extends GoRouteData {
  const AdminRoute();
  static const path = 'admin';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminPage();
  }
}

class UserRoute extends GoRouteData {
  const UserRoute();
  static const path = 'user';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserPage();
  }
}

class GuestRoute extends GoRouteData {
  const GuestRoute();
  static const path = 'guest';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GuestPage();
  }
}

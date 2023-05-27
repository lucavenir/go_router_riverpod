import 'dart:async';

import 'package:example/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/admin_page.dart';
import '../pages/guest_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/splash_page.dart';
import '../pages/user_page.dart';
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

  /// Important note on this redirect function: this isn't reactive.
  /// No redirect will be triggered on a user role change.
  ///
  /// This is currently unsupported.
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final userRole = await ProviderScope.containerOf(context).read(
      permissionsProvider.future,
    );

    return userRole.map(
      admin: (_) => const AdminRoute().location,
      user: (_) => const UserRoute().location,
      guest: (_) => const GuestRoute().location,
      none: (_) => null,
    );
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

/// This route shows how to parametrize a simple page and how to pass a simple query parameter.
@TypedGoRoute<DetailsRoute>(path: DetailsRoute.path)
class DetailsRoute extends GoRouteData {
  const DetailsRoute(this.id, {this.isNuke = false});
  final int id;
  final bool isNuke;
  static const path = '/details/:id';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailsPage(
      id,
      isNuclearCode: isNuke,
    );
  }
}

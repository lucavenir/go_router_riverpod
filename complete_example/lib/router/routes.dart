import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const path = '/splash';

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path, routes: [
  TypedGoRoute<AdminRoute>(path: AdminRoute.path),
  TypedGoRoute<UserRoute>(path: UserRoute.path),
  TypedGoRoute<GuestRoute>(path: GuestRoute.path),
])
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';

  FutureOr<String?> redirect() {
    // This route should be responsible for redirecting through the correct pages
    // But we can't access `context` nor `GoRouteState`.
    // This is because GoRouterBuilder is still "kinda" new.
    // Please upvote this issue https://github.com/flutter/flutter/issues/115955
    // And track this PR https://github.com/flutter/packages/pull/2848
    // And then, wait for GoRouter 5.3.0

    // TODO implement route-level redirection logic based on user permissions
    return null;
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}

class AdminRoute extends GoRouteData {
  const AdminRoute();
  static const path = 'admin';

  @override
  Widget build(BuildContext context) {
    return const AdminPage();
  }
}

class UserRoute extends GoRouteData {
  const UserRoute();
  static const path = 'user';

  @override
  Widget build(BuildContext context) {
    return const UserPage();
  }
}

class GuestRoute extends GoRouteData {
  const GuestRoute();
  static const path = 'guest';

  @override
  Widget build(BuildContext context) {
    return const GuestPage();
  }
}

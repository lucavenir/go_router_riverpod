import 'dart:async';

import 'package:example/entities/auth.dart';
import 'package:example/entities/user_role.dart';
import 'package:example/pages/admin_page.dart';
import 'package:example/pages/details_page.dart';
import 'package:example/pages/guest_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/login_page.dart';
import 'package:example/pages/splash_page.dart';
import 'package:example/pages/user_page.dart';
import 'package:example/state/auth_controller.dart';
import 'package:example/state/permissions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

/// Exposes a [GoRouter] that uses a [Listenable] to refresh its internal state.
///
/// With Riverpod, we can't register a dependency via an Inherited Widget,
/// thus making this implementation the "leanest" possible
///
/// To sync our app state with this our router, we simply update our listenable via `ref.listen`,
/// and pass it to GoRouter's `refreshListenable`.
/// In this example, this will trigger redirects on any authentication change.
///
/// Obviously, more logic could be implemented here, but again, this is meant to be a simple example.
/// You can always build more listenables and even merge more than one into a more complex `ChangeNotifier`,
/// but that's up to your case and out of this scope.
@riverpod
GoRouter router(Ref ref) {
  // build a `Listenable` to be fed to GoRouter
  final auth = ValueNotifier<AsyncValue<Auth?>>(const AsyncLoading());
  ref.onDispose(auth.dispose); // don't forget to clean after yourselves (:

  // update the listenable, when the auth state changes
  ref.listen(authControllerProvider, (_, next) {
    auth.value = next;
  });

  final router = GoRouter(
    navigatorKey: _routerKey,
    refreshListenable: auth,
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      final isSplash = state.uri.path == const SplashRoute().location;
      final isLoggingIn = state.uri.path == const LoginRoute().location;

      switch (auth.value) {
        case AsyncError():
          return const LoginRoute().location;
        case AsyncLoading():
          return const SplashRoute().location;
        case AsyncData(value: null):
          if (isSplash) return const LoginRoute().location;
          if (isLoggingIn) return null;

          return const SplashRoute().location;
        case AsyncData(value: Auth()):
          if (isSplash) return const HomeRoute().location;
          if (isLoggingIn) return const HomeRoute().location;

          return null;
      }
    },
  );
  ref.onDispose(router.dispose); // always clean up after yourselves (:

  return router;
}

final _routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

/// splash route - serves as a "buffer", while we check authentication
@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  /// splash route - serves as a "buffer", while we check authentication
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

/// login route - shows a simple login page
@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  /// login route - shows a simple login page
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<AdminRoute>(path: 'admin'),
    TypedGoRoute<UserRoute>(path: 'user'),
    TypedGoRoute<GuestRoute>(path: 'guest'),
  ],
)
/// home route - redirects based on user role
class HomeRoute extends GoRouteData with $HomeRoute {
  /// home route - redirects based on user role
  const HomeRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final userRole =
        await ProviderScope //
            .containerOf(context, listen: false)
            .read(permissionsProvider.future);

    return switch (userRole) {
      Admin() => const AdminRoute().location,
      User() => const UserRoute().location,
      Guest() => const GuestRoute().location,
      None() => null,
    };
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

/// admin route - shows the admin page
class AdminRoute extends GoRouteData with $AdminRoute {
  /// admin route - shows the admin page
  const AdminRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminPage();
  }
}

/// user route - shows the user page
class UserRoute extends GoRouteData with $UserRoute {
  /// user route - shows the user page
  const UserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserPage();
  }
}

/// guest route - shows the guest page
class GuestRoute extends GoRouteData with $GuestRoute {
  /// guest route - shows the guest page
  const GuestRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GuestPage();
  }
}

/// This route shows how to parametrize a simple page and how to pass a simple query parameter.
@TypedGoRoute<DetailsRoute>(path: '/details/:id')
class DetailsRoute extends GoRouteData with $DetailsRoute {
  /// This route shows how to parametrize a simple page and how to pass a simple query parameter.
  const DetailsRoute(this.id, {this.isNuke = false});

  /// The id of the item to show details for.
  final int id;

  /// Whether to show the nuclear codes or not.
  final bool isNuke;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailsPage(
      id,
      isNuclearCode: isNuke,
    );
  }
}

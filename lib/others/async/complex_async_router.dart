import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../models/async_user.dart';

/// This a slightly more complicated example, featuring:
/// - Riverpod's new [AsyncNotifier] (Riverpod v2)
/// - GoRouter's new asynchronous redirect API
/// - A slightly more complicated asynchronous auth model
/// - An intermediate splash page
/// - Some basic persistence API usage
///
/// What I like about this approach is that auth logic is centralized into its
/// Notifier, whereas logic about routing is kept in here.

// Our router. Nothing special here.
final complexRouterProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: router,
    routes: router._routes,
    redirect: router._redirectLogic,
    initialLocation: '/${SplashPage.routeName}',
  );
});

// This RouterNotifier is pretty much identical to  other examples
class RouterNotifier extends ChangeNotifier {
  ProviderSubscription? unsub;
  RouterNotifier(this.ref) {
    unsub = ref.listen(authProvider, (_, __) {
      notifyListeners();
    });
    // This is just good clean-up practice
    ref.onDispose(() {
      unsub?.close();
    });
  }
  final Ref ref;

  @override
  void dispose() {
    // This is also good practice
    unsub?.close();
    super.dispose();
  }

  // This method isn't asynchronous per se, but it could be
  FutureOr<String?> _redirectLogic(BuildContext context, GoRouterState state) {
    // If our async state is loading, don't perform redirects, yet
    if (ref.read(authProvider.notifier).isLoading) return null;

    final isAuth = ref.read(authProvider.notifier).isAuthenticated;

    final isSplash = state.location == SplashPage.routeLocation;
    // If we're lookin at the splash page, then...
    if (isSplash) {
      // ... properly redirect our users to the right page
      return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
    }

    final isLoggingIn = state.location == LoginPage.routeLocation;
    // If we're looking at the login page...
    if (isLoggingIn) {
      // ... go home when authenticated, stay here when not
      return isAuth ? HomePage.routeLocation : null;
    }

    // At this point we're seeing our home page...
    // ... but go back to login if you've logged out!
    return isAuth ? null : LoginPage.routeLocation;
  }

  /// List and definitions of this app's routes.
  List<GoRoute> get _routes => [
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
      ];
}

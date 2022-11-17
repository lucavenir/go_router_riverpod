import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth.dart';
import 'routes.dart';

part 'router_notifier.g.dart';

@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? routerListener;
  bool? isAuth;

  @override
  void build() {
    ref.listen(
      authNotifierProvider.select((value) => value),
      (previous, next) {
        if (next.isLoading) return;

        isAuth = next.requireValue.map(
          signedIn: (_) => true,
          signedOut: (_) => false,
        );

        routerListener?.call();
      },
    );
  }

  String? redirect(BuildContext context, GoRouterState state) {
    if (isAuth == null) return null;
    final isSplash = state.location == SplashRoute.path;

    if (isSplash) {
      return isAuth! ? HomeRoute.path : LoginRoute.path;
    }

    final isLoggingIn = state.location == LoginRoute.path;
    if (isLoggingIn) return isAuth! ? HomeRoute.path : null;

    return isAuth! ? null : SplashRoute.path;
  }

  /// Our application routes. Obtained through code generation
  List<GoRoute> get routes => $appRoutes;

  /// Adds [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method on creation to handle its
  /// internal [ChangeNotifier].
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}

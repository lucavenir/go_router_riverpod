import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/auth.dart';
import 'routes.dart';

part 'router_notifier.g.dart';

/// This notifier exposes nothing (void) but implements [Listenable].
/// This notifier is meant to just access its internal [Notifier].
///
/// This notifier triggers our router's listener everytime is needed.
/// In this simple case, we do so when `auth` changes.
///
/// SIDE NOTE.
/// This might look overcomplicated at a first glance;
/// Instead, this method aims to follow some good some good practices:
///   1. It doesn't require us to pipe down any `ref` parameter
///   2. Since it's not meant to be _watched_, it uselessly rebuild a [GoRouter]
///      every time something changes
///   3. It works as a complete replacement for [ChangeNotifier] (it's a [Listenable] implementation)
///   4. It allows for listening to multiple providers if needed
@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<bool> build() async {
    // One could watch more providers and write logic accordingly

    final isAuth = await ref.watch(
      authNotifierProvider.selectAsync(
          (data) => data.map(signedIn: (_) => true, signedOut: (_) => false)),
    );

    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      routerListener?.call();
    });

    return isAuth;
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    final isAuth = this.state.valueOrNull;

    if (isAuth == null) return null;
    final isSplash = state.location == SplashRoute.path;

    if (isSplash) {
      return isAuth ? HomeRoute.path : LoginRoute.path;
    }

    final isLoggingIn = state.location == LoginRoute.path;
    if (isLoggingIn) return isAuth ? HomeRoute.path : null;

    return isAuth ? null : SplashRoute.path;
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

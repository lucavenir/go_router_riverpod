import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/auth.dart';
import 'routes.dart';

part 'router_notifier.g.dart';

/// This notifier exposes nothing (void) but implements [Listenable]
/// Long story short: this notifier is used to be passed to our router.
/// It triggers our router's listener everytime is needed.
/// In this simple case, we do so when `auth` changes.
/// This might look complicated at first, but instead follows good practices:
///   1. It doesn't require us to pipe down any `ref` parameter
///   2. It follows the Single-Responsibility principle: it won't uselessly try
///      to rebuild a [GoRouter] and instead it just works as a [Listenable] implementation
///   3. It allows for listening to multiple providers if needed, and to execute
///      its [routerListener] calls accordingly
@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? routerListener;
  bool? isAuth;

  @override
  Future<void> build() async {
    final authState = await ref.watch(authNotifierProvider.future);
    // One could watch more providers, here, and write logic accordingly

    // If we're in a loading state, there's no need to notify our router.
    // Note. This notifier will never be in a [AsyncError] state.
    // (unless we override it, but it wouldn't make sense)
    if (state.isLoading) return;

    isAuth = authState.map(
      signedIn: (_) => true,
      signedOut: (_) => false,
    );

    routerListener?.call();
  }

  /// Redirects the user when our authentication changes
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_notifier.dart';
import 'routes.dart';

part 'router.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

/// This simple provider caches our GoRouter.
/// This provider will never rebuild by design.
@riverpod
GoRouter router(RouterRef ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _key,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: SplashRoute.path,
    routes: notifier.routes,
    redirect: notifier.redirect,
  );
}

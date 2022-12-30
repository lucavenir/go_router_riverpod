import 'package:complete_example/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_notifier.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

/// This simple provider caches our GoRouter.
final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _key,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: SplashPage.path,
    routes: notifier.routes,
    redirect: notifier.redirect,
  );
});

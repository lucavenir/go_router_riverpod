import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/router.dart';
import 'utils/state_logger.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: MyAwesomeApp(),
    ),
  );
}

class MyAwesomeApp extends ConsumerWidget {
  const MyAwesomeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'hooks_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

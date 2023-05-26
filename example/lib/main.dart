import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/router_listenable.dart';
import 'router/routes.dart';
import 'state/auth_state.dart';
import 'utils/state_logger.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: MyAwesomeApp(),
    ),
  );
}

class MyAwesomeApp extends HookConsumerWidget {
  const MyAwesomeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(routerListenableProvider.notifier);

    final key = useRef(GlobalKey<NavigatorState>(debugLabel: 'routerKey'));
    final router = useMemoized(
      () => GoRouter(
        navigatorKey: key.value,
        refreshListenable: notifier,
        initialLocation: SplashRoute.path,
        debugLogDiagnostics: true,
        routes: $appRoutes,
        redirect: notifier.redirect,
      ),
      [notifier],
    );

    return MaterialApp.router(
      routerConfig: router,
      title: 'hooks_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your phenomenal app')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            ElevatedButton(
              onPressed: ref.read(authNotifierProvider.notifier).logout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            ElevatedButton(
              onPressed: () => ref.read(authNotifierProvider.notifier).login(
                    'myEmail',
                    'myPassword',
                  ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash Page')),
    );
  }
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Admin Page')),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('User Page')),
    );
  }
}

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Guest Page')),
    );
  }
}

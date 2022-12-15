import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/router.dart';
import 'state/auth.dart';
import 'utils/state_logger.dart';

void main() {
  runApp(
    const ProviderScope(observers: [StateLogger()], child: MyAwesomeApp()),
  );
}

class MyAwesomeApp extends ConsumerWidget {
  const MyAwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'flutter_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const path = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your phenomenal app")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home Page"),
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logout();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static const path = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Login Page"),
            ElevatedButton(
              onPressed: () async {
                ref.read(authNotifierProvider.notifier).login(
                      "myEmail",
                      "myPassword",
                    );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const path = '/splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash Page")),
    );
  }
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  static const path = 'admin';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Admin Page")),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  static const path = 'user';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("User Page")),
    );
  }
}

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});
  static const path = 'guest';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Guest Page")),
    );
  }
}

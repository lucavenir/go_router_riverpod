import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Comment out the implementation you're not using
// import 'sync_router.dart';
// import './others/sync/sync_router_streams.dart';
// import './others/sync/sync_router_value_notifier.dart';
// import './others/async/simple_async_router.dart';
import './others/async/complex_async_router.dart';
// Comment out the async import if you're using any other examples.
import 'models/async_user.dart';
// import 'models/user.dart';

void main() {
  runApp(const ProviderScope(child: MyAwesomeApp()));
}

class MyAwesomeApp extends ConsumerWidget {
  const MyAwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Comment out the implementation you're not using
    // final router = ref.watch(valueNotifierRouterProvider);
    // final router = ref.watch(streamsRouterProvider);
    // final router = ref.watch(asyncRouterProvider);
    // final router = ref.watch(syncRouterProvider);
    final router = ref.watch(complexRouterProvider);

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'flutter_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  static String get routeName => 'home';
  static String get routeLocation => '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your phenomenal app")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is your homepage. Horray!"),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
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
  const LoginPage({Key? key}) : super(key: key);
  static String get routeName => 'login';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Looks like you're not logged in. Let's change that."),
            ElevatedButton(
              onPressed: () async {
                ref.read(authProvider.notifier).login(
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
  const SplashPage({Key? key}) : super(key: key);
  static String get routeName => 'splash';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

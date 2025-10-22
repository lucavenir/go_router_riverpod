import 'package:example/router/router.dart';
import 'package:example/state/auth_controller.dart';
import 'package:example/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A simple login page with a button to trigger login.
class LoginPage extends ConsumerStatefulWidget {
  /// A simple login page with a button to trigger login.
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginMutation = ref.watch(AuthController.loginMutation);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            ElevatedButton.icon(
              onPressed: switch (loginMutation) {
                MutationPending() => null,
                _ => login,
              },
              icon: const Icon(Icons.door_front_door),
              label: switch (loginMutation) {
                MutationPending() => const SmallLoadingSpinner(),
                _ => const Text('Login'),
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    await AuthController.loginMutation.run(ref, (ref) {
      return ref.get(authControllerProvider.notifier).login('myEmail', 'myPassword');
    });

    if (!mounted) return;
    const HomeRoute().go(context);
  }
}

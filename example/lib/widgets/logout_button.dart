import 'package:example/router/router.dart';
import 'package:example/state/auth_controller.dart';
import 'package:example/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// a button that triggers the logout action
class LogoutButton extends ConsumerStatefulWidget {
  /// a button that triggers the logout action
  const LogoutButton({super.key});

  @override
  ConsumerState<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends ConsumerState<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    final logout = ref.watch(AuthController.logoutMutation);

    return ElevatedButton.icon(
      onPressed: switch (logout) {
        MutationPending() => null,
        _ => _logout,
      },
      icon: const Icon(Icons.logout),
      label: switch (logout) {
        MutationPending() => const SmallLoadingSpinner(),
        _ => const Text('Logout'),
      },
    );
  }

  Future<void> _logout() async {
    await AuthController.logoutMutation.run(ref, (ref) {
      return ref.get(authControllerProvider.notifier).logout();
    });

    if (!mounted) return;

    const SplashRoute().go(context);
  }
}

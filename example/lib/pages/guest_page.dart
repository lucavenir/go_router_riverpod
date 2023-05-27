import 'package:example/state/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuestPage extends ConsumerWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Guest Page', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("It's not like you can do much, here."),
            const SizedBox(height: 8),
            const Text("After all, you're a guest"),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: ref.read(authControllerProvider.notifier).logout,
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

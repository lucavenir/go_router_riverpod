import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/logout_button.dart';

class GuestPage extends ConsumerWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Guest Page', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("It's not like you can do much, here."),
            SizedBox(height: 8),
            Text("After all, you're a guest"),
            SizedBox(height: 40),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}

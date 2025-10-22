import 'package:example/state/permissions.dart';
import 'package:example/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The home page of our application.
class HomePage extends ConsumerWidget {
  /// The home page of our application.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(permissionsProvider, (previous, next) {});

    return Scaffold(
      appBar: AppBar(title: const Text('Your phenomenal app')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page'),
            Text("There's nothing much you can do, here"),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}

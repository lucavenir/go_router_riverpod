import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/cute_rabbits.dart';
import '../widgets/logout_button.dart';
import '../widgets/my_sliver_list.dart';
import '../widgets/user_title.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rabbits = ref.watch(cuteRabbitsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('User Page', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Looks like you've got enough permissions to... pick up some rabbits 😍",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: UserTitle()),
                      MySliverList(elements: rabbits),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const LogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

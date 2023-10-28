import 'package:example/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/cute_rabbits.dart';
import '../state/nuclear_codes.dart';
import '../widgets/my_sliver_list.dart';
import '../widgets/user_title.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codes = ref.watch(nuclearCodesProvider);
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
                  child: Text('Admin Page', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Woah, just look at the stuff you could do in here.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(child: _AdminTitle()),
                      MySliverList(elements: codes, isNuke: true),
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

class _AdminTitle extends StatelessWidget {
  const _AdminTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text(
        '☢️ Admin? Here, use these nukes ☢️',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

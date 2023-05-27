import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage(this.detailCode, {required this.isNuclearCode, super.key});
  final int detailCode;
  final bool isNuclearCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = isNuclearCode
        ? "Here's your nuke. Use them carefully, like, don't drop 'em, k?"
        : "Here's your unique identifier of your new fluffy friend 😍";

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 60),
              Text('$detailCode'),
              const SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed: () => context.pop(true),
                icon: const Icon(Icons.explicit),
                label: const Text('Make it go boom.'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => context.pop(false),
                icon: const Icon(Icons.home),
                label: const Text('Take it home and take care of it.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

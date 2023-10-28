import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../hooks/use_side_effect.dart';
import 'loading_spinner.dart';

class ActionButton extends HookWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });
  final AsyncCallback onPressed;
  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final (clear: _, :mutate, :snapshot) = useSideEffect<void>();
    Future<void> pressButton() async {
      final future = onPressed();
      mutate(future);
      try {
        await future;
      } catch (exception) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong $exception')),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton.icon(
        onPressed: switch (snapshot) {
          AsyncSnapshot(connectionState: ConnectionState.waiting) => null,
          _ => pressButton,
        },
        icon: switch (snapshot) {
          AsyncSnapshot(connectionState: ConnectionState.waiting) => const LoadingSpinner(),
          _ => icon,
        },
        label: label,
      ),
    );
  }
}

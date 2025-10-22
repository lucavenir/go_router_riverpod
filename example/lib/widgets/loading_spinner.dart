import 'package:flutter/material.dart';

/// A small loading spinner widget
class SmallLoadingSpinner extends StatelessWidget {
  /// A small loading spinner widget
  const SmallLoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 16,
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
      ),
    );
  }
}

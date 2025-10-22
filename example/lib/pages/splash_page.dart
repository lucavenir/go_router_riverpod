import 'package:example/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';

/// splash page shown while we check authentication status
class SplashPage extends StatelessWidget {
  /// splash page shown while we check authentication status
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash Page'),
            SizedBox(height: 16),
            SmallLoadingSpinner(),
          ],
        ),
      ),
    );
  }
}

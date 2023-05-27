import 'package:flutter/material.dart';

class UserTitle extends StatelessWidget {
  const UserTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text(
        '🐰 Hello, User! Select your rabbits 🐰',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

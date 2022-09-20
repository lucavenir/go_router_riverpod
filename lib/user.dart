import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final String email;

  const User({required this.name, required this.email});
}

class UserState extends StateNotifier<User?> {
  UserState() : super(null);
  String? myToken;

  Future<void> login(String email, String password) async {
    // This mocks a login attempt with email and password
    state = await Future.delayed(
      const Duration(milliseconds: 750),
      () => const User(name: "My Name", email: "My Email"),
    );
    myToken = 'my-super-secret-jwt'; // Mock of a permanent storage save
  }

  Future<void> loginWithToken() async {
    if (myToken == null) throw const LogoutException('Nothing to do here.');

    // This mocks a login attempt with a saved token
    final logInAttempt = await Future.delayed(
      const Duration(milliseconds: 750),
      () => Random().nextBool(),
    );

    // If the attempts succeeds, the current page can be shown
    if (logInAttempt) state = const User(name: "My Name", email: "My Email");

    // If the attempt fails, or returns 401, or whatever, redirect to login
    throw const UnauthorizedException('Unauthorized');
  }

  Future<void> logout() async {
    // In this example user==null iff we're logged out
    myToken = null; // Remove the token from our perma storage FIRST
    state = null; // No request is mocked here but I guess we could
  }
}

final userProvider = StateNotifierProvider<UserState, User?>((ref) {
  return UserState();
});

class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException(this.message);
}

class LogoutException implements Exception {
  final String message;
  const LogoutException(this.message);
}

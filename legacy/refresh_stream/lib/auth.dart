import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  /// This mocks a login attempt with email and password
  Future<void> login(String email, String password) async {
    state = await Future.delayed(
      const Duration(milliseconds: 750),
      () => true,
    );
  }

  /// This mocks a logout action
  Future<void> logout() async {
    state = false; // No request is mocked here but I guess we could
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});

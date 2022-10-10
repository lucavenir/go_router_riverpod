import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);
  String? token;

  /// This mocks a login attempt with email and password
  Future<void> login(String email, String password) async {
    state = await Future.delayed(
      const Duration(milliseconds: 750),
      () => true,
    );
    token = "some-token-obtained-from-the-login-API";
  }

  /// This mocks a logout action
  Future<void> logout() async {
    state = false; // No request is mocked here but I guess we could
    token = null;
  }

  // This mocks a login with a saved token
  Future<void> loginWithToken() async {
    if (token == null) throw 'We have no token saved.';

    // This mocks a login attempt with a saved token
    final logInAttempt = await Future.delayed(
      const Duration(milliseconds: 750),
      () => false,
    );

    if (!logInAttempt) throw "Our token wasn't valid or something went wrong.";

    // Here, this attempt finally succeeds
    state = true;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});

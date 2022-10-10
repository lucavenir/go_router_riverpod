import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  const User({
    required this.displayName,
    required this.email,
    required this.token,
  });

  final String displayName;
  final String email;
  final String token;
}

// TODO in the next version: Use Freezed to generate states.
typedef AsyncUser = AsyncValue<User?>;

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<User?> {
  AuthNotifier();
  static const _key = 'token';

  @override
  FutureOr<User?> build() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    ref.listenSelf((_, next) {
      final val = next.valueOrNull;
      if (val == null) {
        sharedPreferences.remove(_key);
        return;
      }
      sharedPreferences.setString(_key, val.email);
    });

    try {
      // This operation might fail for... reasons
      final savedToken = sharedPreferences.getString(_key);
      if (savedToken == null) return null;

      // This request might also fail
      return await _loginWithToken(savedToken);
    } catch (error, stackTrace) {
      // If anything goes wrong, give a non-authenticated outcome
      await sharedPreferences.remove(_key);
      print(error);
      print(stackTrace);
      return null;
    }
  }

  Future<User?> _loginWithToken(String token) async {
    // here the token should be used to perform a login request
    final logInAttempt = await Future.delayed(
      const Duration(milliseconds: 750),
      () => Random().nextBool(),
    );

    // If the attempts succeeds, return the result out
    if (logInAttempt) {
      return const User(
        displayName: "My Name",
        email: "My Email",
        token: "some-updated-secret-auth-token",
      );
    }

    // If the attempt fails, or returns 401, or whatever, this should fail.
    throw const UnauthorizedException('401 Unauthorized or something');
  }

  Future<void> logout() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    // Remove the token from persistence, first
    await sharedPreferences.remove(_key);
    // No request is mocked here but I guess we could: logout
    state = const AsyncUser.data(null);
  }

  Future<void> login(String email, String password) async {
    // Simple mock of a successful login attempt
    state = await AsyncUser.guard(() async {
      return Future.delayed(
        Duration(milliseconds: Random().nextInt(750)),
        () => const User(
          displayName: "My Name",
          email: "My Email",
          token: 'someToken',
        ),
      );
    });
  }

  bool get isAuthenticated => state.valueOrNull != null;
  bool get isLoading => state.isLoading;
}

class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException(this.message);
}

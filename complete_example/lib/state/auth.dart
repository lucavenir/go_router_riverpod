import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/user.dart';

/// A mock of an Authenticated User
const _dummyUser = User(
  id: 0,
  displayName: "My Name",
  email: "My Email",
  token: "some-updated-secret-auth-token",
);

/// This notifier holds and handles the authentication state of the application
class AuthNotifier extends AutoDisposeAsyncNotifier<User?> {
  late SharedPreferences sharedPreferences;
  static const _sharedPrefsKey = 'token';

  /// Mock of the duration of a network request

  @override
  FutureOr<User?> build() async {
    sharedPreferences = await SharedPreferences.getInstance();

    _persistenceRefreshLogic();

    return await _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistant storage.
  /// If _anything_ goes wrong, deletes the internal token and returns a [User.signedOut].
  Future<User?> _loginRecoveryAttempt() async {
    try {
      final savedToken = sharedPreferences.getString(_sharedPrefsKey);
      if (savedToken == null) {
        throw const UnauthorizedException(
            "Couldn't find the authentication token");
      }

      return await _loginWithToken(savedToken);
    } catch (_, __) {
      await sharedPreferences.remove(_sharedPrefsKey);
      return null;
    }
  }

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    await Future.delayed(networkRoundTripTime);
    state = const AsyncValue.data(null);
  }

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login(String email, String password) async {
    state = await AsyncValue.guard<User>(() async {
      return Future.delayed(
        networkRoundTripTime,
        () => _dummyUser,
      );
    });
  }

  /// Mock of a login request performed with a saved token.
  /// If such request fails, this method will throw an [UnauthorizedException].
  Future<User> _loginWithToken(String token) async {
    final logInAttempt = await Future.delayed(
      networkRoundTripTime,
      () => true,
    );

    if (logInAttempt) return _dummyUser;

    throw const UnauthorizedException('401 Unauthorized or something');
  }

  /// Internal method used to listen authentication state changes.
  /// When the auth object is in a loading state, nothing happens.
  /// When the auth object is in a error state, we choose to remove the token
  /// Otherwise, we expect the current auth value to be reflected in our persitence API
  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        sharedPreferences.remove(_sharedPrefsKey);
        return;
      }

      final val = next.requireValue;
      final isAuthenticated = val == null;

      isAuthenticated
          ? sharedPreferences.remove(_sharedPrefsKey)
          : sharedPreferences.setString(_sharedPrefsKey, val.token);
    });
  }
}

final authNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException(this.message);
}

/// Mock of the duration of a network request
const networkRoundTripTime = Duration(milliseconds: 750);

import 'dart:async';

import 'package:example/entities/auth.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time/time.dart';

part 'auth_controller.g.dart';

/// A mock of an Authenticated User
const _dummyUser = Auth(
  id: 42069,
  displayName: 'Gojo Satoru',
  email: 'gojo.satoru@example.com',
  token: 'some-super-secret-auth-token',
);

/// This controller is an [AsyncNotifier] that holds and handles our authentication state
@riverpod
class AuthController extends _$AuthController {
  late SharedPreferences _sharedPreferences;
  static const _tokenKey = 'token';

  @override
  Future<Auth?> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    // When the auth object is in an error state, we choose to remove the token
    // Otherwise, and if we've got new data, we persist the value
    // notice how this could be done with riverpod's persist experimental API
    listenSelf((_, next) {
      if (next case AsyncError()) {
        _sharedPreferences.remove(_tokenKey);
      }
      if (next case AsyncData(:final value)) {
        switch (value) {
          case Auth():
            _sharedPreferences.setString(_tokenKey, value.token);
          case null:
            _sharedPreferences.remove(_tokenKey);
        }
      }
    });

    return _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistent storage.
  /// If _anything_ goes wrong, deletes the internal token and returns `null`.
  Future<Auth?> _loginRecoveryAttempt() {
    try {
      final savedToken = _sharedPreferences.getString(_tokenKey);
      if (savedToken == null) {
        throw const UnauthorizedException('No auth token found');
      }

      return _refreshToken(savedToken);
    } on Exception {
      _sharedPreferences.remove(_tokenKey).ignore();
      return Future.value();
    }
  }

  /// logout mutation action
  static final logoutMutation = Mutation<void>();

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    await Future<void>.delayed(networkRoundTripTime);
    state = const AsyncData(null);
  }

  /// logout mutation action
  static final loginMutation = Mutation<void>();

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login(String email, String password) async {
    final result = await Future.delayed(
      networkRoundTripTime,
      () => _dummyUser,
    );
    state = AsyncData(result);
  }

  /// Mock of a login refresh, performed with a saved token.
  /// If such request fails, this method will throw an [UnauthorizedException].
  Future<Auth> _refreshToken(String token) async {
    final logInAttempt = await Future.delayed(
      networkRoundTripTime,
      () => true, // edit this if you wanna play around
    );

    if (logInAttempt) return _dummyUser;

    throw const UnauthorizedException('401 Unauthorized or something');
  }
}

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  /// Simple mock of a 401 exception
  const UnauthorizedException(this.message);

  /// The exception message
  final String message;
}

/// Mock of the duration of a network request
final Duration networkRoundTripTime = 2.seconds;

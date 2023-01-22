import 'dart:math';

import 'package:complete_example/state/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/user_role.dart';

/// If our user is signed out, this provider returns [UserRole.none]
/// Otherwise, it mocks a network request and gives out some [UserRole].
final permissionsProvider = FutureProvider.autoDispose<UserRole>((ref) async {
  final userId = await ref.watch(authNotifierProvider.future);

  if (userId == null) return UserRole.none;

  return _requestMock();
});

/// Gives a random [UserRole] based on a dice roll.
UserRole _requestMock() {
  // mock
  final random = Random().nextDouble();

  if (random < 0.25) {
    return UserRole.admin;
  } else if (random < 0.5) {
    return UserRole.verifiedUser;
  } else if (random < 0.75) {
    return UserRole.unverifiedUser;
  } else {
    return UserRole.guest;
  }
}

import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/user_role.dart';
import 'auth.dart';

part 'permissions.g.dart';

/// If our user is signed out, this provider returns [UserRole.none]
/// Otherwise, it mocks a network request and gives out some [UserRole].
@riverpod
Future<UserRole> permissions(PermissionsRef ref) async {
  final userId = await ref.watch(
    authNotifierProvider.selectAsync(
      (value) => value.map(
        signedIn: (signedIn) => signedIn.id,
        signedOut: (signedOut) => null,
      ),
    ),
  );

  if (userId == null) return const UserRole.none();

  return _requestMock();
}

/// Gives a random [UserRole] based on a dice roll.
UserRole _requestMock() {
  // mock
  final random = Random().nextDouble();

  if (random < 0.25) {
    return const UserRole.admin();
  } else if (random < 0.5) {
    return const UserRole.verifiedUser();
  } else if (random < 0.75) {
    return const UserRole.unverifiedUser();
  } else {
    return const UserRole.guest();
  }
}

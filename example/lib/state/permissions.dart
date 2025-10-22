import 'dart:math';

import 'package:example/entities/user_role.dart';
import 'package:example/state/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions.g.dart';

/// If our user is signed out, this provider returns [UserRole.none]
/// Otherwise, it mocks a network request and gives out some [UserRole].
@riverpod
Future<UserRole> permissions(Ref ref) async {
  final auth = await ref.watch(authControllerProvider.future);
  final userId = auth?.id;

  if (userId == null) return const UserRole.none();

  final result = _requestMock();

  ref.keepAlive();

  return result;
}

/// Gives a random [UserRole] based on a dice roll.
UserRole _requestMock() {
  // mock. play with these odds as you wish; or, change this method entirely.
  final random = Random().nextDouble();

  if (random < 0.25) {
    return const UserRole.admin();
  } else if (random < 0.5) {
    return const UserRole.user();
  } else {
    return const UserRole.guest();
  }
}

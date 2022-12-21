import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role.freezed.dart';

/// Self-explanatory entity class.
/// It is used to distinguish the logged in user permissions.
@freezed
class UserRole with _$UserRole {
  const factory UserRole.admin() = Admin;
  const factory UserRole.user() = User;
  const factory UserRole.guest() = Guest;
  const factory UserRole.none() = None;
}

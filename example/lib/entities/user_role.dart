import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role.freezed.dart';

/// Self-explanatory entity class.
/// It is used to distinguish the logged in user permissions.
@freezed
sealed class UserRole with _$UserRole {
  /// user role: admin; can do everything.
  const factory UserRole.admin() = Admin;

  /// user role: user; can do regular stuff.
  const factory UserRole.user() = User;

  /// user role: guest; can do limited stuff.
  const factory UserRole.guest() = Guest;

  /// user role: none; can't do anything (not logged in).
  const factory UserRole.none() = None;
}

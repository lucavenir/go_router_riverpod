// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRole {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() verifiedUser,
    required TResult Function() unverifiedUser,
    required TResult Function() guest,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? verifiedUser,
    TResult? Function()? unverifiedUser,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? verifiedUser,
    TResult Function()? unverifiedUser,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(VerifiedUser value) verifiedUser,
    required TResult Function(UnverifiedUser value) unverifiedUser,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(VerifiedUser value)? verifiedUser,
    TResult? Function(UnverifiedUser value)? unverifiedUser,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(VerifiedUser value)? verifiedUser,
    TResult Function(UnverifiedUser value)? unverifiedUser,
    TResult Function(Guest value)? guest,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleCopyWith<$Res> {
  factory $UserRoleCopyWith(UserRole value, $Res Function(UserRole) then) =
      _$UserRoleCopyWithImpl<$Res, UserRole>;
}

/// @nodoc
class _$UserRoleCopyWithImpl<$Res, $Val extends UserRole>
    implements $UserRoleCopyWith<$Res> {
  _$UserRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AdminCopyWith<$Res> {
  factory _$$AdminCopyWith(_$Admin value, $Res Function(_$Admin) then) =
      __$$AdminCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdminCopyWithImpl<$Res> extends _$UserRoleCopyWithImpl<$Res, _$Admin>
    implements _$$AdminCopyWith<$Res> {
  __$$AdminCopyWithImpl(_$Admin _value, $Res Function(_$Admin) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Admin implements Admin {
  const _$Admin();

  @override
  String toString() {
    return 'UserRole.admin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Admin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() verifiedUser,
    required TResult Function() unverifiedUser,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return admin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? verifiedUser,
    TResult? Function()? unverifiedUser,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return admin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? verifiedUser,
    TResult Function()? unverifiedUser,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (admin != null) {
      return admin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(VerifiedUser value) verifiedUser,
    required TResult Function(UnverifiedUser value) unverifiedUser,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return admin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(VerifiedUser value)? verifiedUser,
    TResult? Function(UnverifiedUser value)? unverifiedUser,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return admin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(VerifiedUser value)? verifiedUser,
    TResult Function(UnverifiedUser value)? unverifiedUser,
    TResult Function(Guest value)? guest,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (admin != null) {
      return admin(this);
    }
    return orElse();
  }
}

abstract class Admin implements UserRole {
  const factory Admin() = _$Admin;
}

/// @nodoc
abstract class _$$VerifiedUserCopyWith<$Res> {
  factory _$$VerifiedUserCopyWith(
          _$VerifiedUser value, $Res Function(_$VerifiedUser) then) =
      __$$VerifiedUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifiedUserCopyWithImpl<$Res>
    extends _$UserRoleCopyWithImpl<$Res, _$VerifiedUser>
    implements _$$VerifiedUserCopyWith<$Res> {
  __$$VerifiedUserCopyWithImpl(
      _$VerifiedUser _value, $Res Function(_$VerifiedUser) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifiedUser implements VerifiedUser {
  const _$VerifiedUser();

  @override
  String toString() {
    return 'UserRole.verifiedUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifiedUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() verifiedUser,
    required TResult Function() unverifiedUser,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return verifiedUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? verifiedUser,
    TResult? Function()? unverifiedUser,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return verifiedUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? verifiedUser,
    TResult Function()? unverifiedUser,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (verifiedUser != null) {
      return verifiedUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(VerifiedUser value) verifiedUser,
    required TResult Function(UnverifiedUser value) unverifiedUser,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return verifiedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(VerifiedUser value)? verifiedUser,
    TResult? Function(UnverifiedUser value)? unverifiedUser,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return verifiedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(VerifiedUser value)? verifiedUser,
    TResult Function(UnverifiedUser value)? unverifiedUser,
    TResult Function(Guest value)? guest,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (verifiedUser != null) {
      return verifiedUser(this);
    }
    return orElse();
  }
}

abstract class VerifiedUser implements UserRole {
  const factory VerifiedUser() = _$VerifiedUser;
}

/// @nodoc
abstract class _$$UnverifiedUserCopyWith<$Res> {
  factory _$$UnverifiedUserCopyWith(
          _$UnverifiedUser value, $Res Function(_$UnverifiedUser) then) =
      __$$UnverifiedUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnverifiedUserCopyWithImpl<$Res>
    extends _$UserRoleCopyWithImpl<$Res, _$UnverifiedUser>
    implements _$$UnverifiedUserCopyWith<$Res> {
  __$$UnverifiedUserCopyWithImpl(
      _$UnverifiedUser _value, $Res Function(_$UnverifiedUser) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnverifiedUser implements UnverifiedUser {
  const _$UnverifiedUser();

  @override
  String toString() {
    return 'UserRole.unverifiedUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnverifiedUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() verifiedUser,
    required TResult Function() unverifiedUser,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return unverifiedUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? verifiedUser,
    TResult? Function()? unverifiedUser,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return unverifiedUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? verifiedUser,
    TResult Function()? unverifiedUser,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (unverifiedUser != null) {
      return unverifiedUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(VerifiedUser value) verifiedUser,
    required TResult Function(UnverifiedUser value) unverifiedUser,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return unverifiedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(VerifiedUser value)? verifiedUser,
    TResult? Function(UnverifiedUser value)? unverifiedUser,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return unverifiedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(VerifiedUser value)? verifiedUser,
    TResult Function(UnverifiedUser value)? unverifiedUser,
    TResult Function(Guest value)? guest,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (unverifiedUser != null) {
      return unverifiedUser(this);
    }
    return orElse();
  }
}

abstract class UnverifiedUser implements UserRole {
  const factory UnverifiedUser() = _$UnverifiedUser;
}

/// @nodoc
abstract class _$$GuestCopyWith<$Res> {
  factory _$$GuestCopyWith(_$Guest value, $Res Function(_$Guest) then) =
      __$$GuestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GuestCopyWithImpl<$Res> extends _$UserRoleCopyWithImpl<$Res, _$Guest>
    implements _$$GuestCopyWith<$Res> {
  __$$GuestCopyWithImpl(_$Guest _value, $Res Function(_$Guest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Guest implements Guest {
  const _$Guest();

  @override
  String toString() {
    return 'UserRole.guest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Guest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() verifiedUser,
    required TResult Function() unverifiedUser,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return guest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? verifiedUser,
    TResult? Function()? unverifiedUser,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return guest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? verifiedUser,
    TResult Function()? unverifiedUser,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(VerifiedUser value) verifiedUser,
    required TResult Function(UnverifiedUser value) unverifiedUser,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return guest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(VerifiedUser value)? verifiedUser,
    TResult? Function(UnverifiedUser value)? unverifiedUser,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return guest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(VerifiedUser value)? verifiedUser,
    TResult Function(UnverifiedUser value)? unverifiedUser,
    TResult Function(Guest value)? guest,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest(this);
    }
    return orElse();
  }
}

abstract class Guest implements UserRole {
  const factory Guest() = _$Guest;
}

/// @nodoc
abstract class _$$NoneCopyWith<$Res> {
  factory _$$NoneCopyWith(_$None value, $Res Function(_$None) then) =
      __$$NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneCopyWithImpl<$Res> extends _$UserRoleCopyWithImpl<$Res, _$None>
    implements _$$NoneCopyWith<$Res> {
  __$$NoneCopyWithImpl(_$None _value, $Res Function(_$None) _then)
      : super(_value, _then);
}

/// @nodoc

class _$None implements None {
  const _$None();

  @override
  String toString() {
    return 'UserRole.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() verifiedUser,
    required TResult Function() unverifiedUser,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? verifiedUser,
    TResult? Function()? unverifiedUser,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? verifiedUser,
    TResult Function()? unverifiedUser,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(VerifiedUser value) verifiedUser,
    required TResult Function(UnverifiedUser value) unverifiedUser,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(VerifiedUser value)? verifiedUser,
    TResult? Function(UnverifiedUser value)? unverifiedUser,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(VerifiedUser value)? verifiedUser,
    TResult Function(UnverifiedUser value)? unverifiedUser,
    TResult Function(Guest value)? guest,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class None implements UserRole {
  const factory None() = _$None;
}

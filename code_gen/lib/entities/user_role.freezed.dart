// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function() user,
    required TResult Function() guest,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? user,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? user,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(User value) user,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(User value)? user,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(User value)? user,
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
    required TResult Function() user,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return admin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? user,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return admin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? user,
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
    required TResult Function(User value) user,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return admin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(User value)? user,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return admin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(User value)? user,
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
abstract class _$$UserCopyWith<$Res> {
  factory _$$UserCopyWith(_$User value, $Res Function(_$User) then) =
      __$$UserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserCopyWithImpl<$Res> extends _$UserRoleCopyWithImpl<$Res, _$User>
    implements _$$UserCopyWith<$Res> {
  __$$UserCopyWithImpl(_$User _value, $Res Function(_$User) _then)
      : super(_value, _then);
}

/// @nodoc

class _$User implements User {
  const _$User();

  @override
  String toString() {
    return 'UserRole.user()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$User);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() user,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return user();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? user,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return user?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? user,
    TResult Function()? guest,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(User value) user,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(User value)? user,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(User value)? user,
    TResult Function(Guest value)? guest,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }
}

abstract class User implements UserRole {
  const factory User() = _$User;
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
    required TResult Function() user,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return guest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? user,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return guest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? user,
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
    required TResult Function(User value) user,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return guest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(User value)? user,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return guest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(User value)? user,
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
    required TResult Function() user,
    required TResult Function() guest,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? user,
    TResult? Function()? guest,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? user,
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
    required TResult Function(User value) user,
    required TResult Function(Guest value) guest,
    required TResult Function(None value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(User value)? user,
    TResult? Function(Guest value)? guest,
    TResult? Function(None value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(User value)? user,
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

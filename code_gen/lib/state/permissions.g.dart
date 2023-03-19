// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$permissionsHash() => r'96a87d1aa45cb2d1fb614a3edc61910cc95dd364';

/// If our user is signed out, this provider returns [UserRole.none]
/// Otherwise, it mocks a network request and gives out some [UserRole].
///
/// Copied from [permissions].
@ProviderFor(permissions)
final permissionsProvider = AutoDisposeFutureProvider<UserRole>.internal(
  permissions,
  name: r'permissionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$permissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PermissionsRef = AutoDisposeFutureProviderRef<UserRole>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $RouterNotifierHash() => r'73e34a3778f65c4afb89e76bf3fa062d4f162c37';

/// This notifier exposes nothing (void) but implements [Listenable].
/// This notifier is meant to just access its internal [Notifier].
///
/// This notifier triggers our router's listener everytime is needed.
/// In this simple case, we do so when `auth` changes.
///
/// SIDE NOTE.
/// This might look overcomplicated at a first glance;
/// Instead, this method aims to follow some good some good practices:
///   1. It doesn't require us to pipe down any `ref` parameter
///   2. Since it's not meant to be _watched_, it uselessly rebuild a [GoRouter]
///      every time something changes
///   3. It works as a complete replacement for [ChangeNotifier] (it's a [Listenable] implementation)
///   4. It allows for listening to multiple providers if needed
///
/// Copied from [RouterNotifier].
final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifier, bool>(
  RouterNotifier.new,
  name: r'routerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $RouterNotifierHash,
);
typedef RouterNotifierRef = AutoDisposeAsyncNotifierProviderRef<bool>;

abstract class _$RouterNotifier extends AutoDisposeAsyncNotifier<bool> {
  @override
  FutureOr<bool> build();
}

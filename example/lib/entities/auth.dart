import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

/// Authentication class for this sample application.
/// It should be self-explanatory.
@freezed
abstract class Auth with _$Auth {
  /// Represents a signed-in user
  const factory Auth({
    required int id,
    required String displayName,
    required String email,
    required String token,
  }) = SignedIn;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Authentication class for this sample application.
/// It shuold be self-explanatory.
@freezed
class User with _$User {
  const factory User.signedIn({
    required int id,
    required String displayName,
    required String email,
    required String token,
  }) = SignedIn;

  const factory User.signedOut() = SignedOut;
}

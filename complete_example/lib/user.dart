import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

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

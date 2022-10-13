import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// With firebase I often find myself writing simple providers
// Usually, stream-based redirects is more than enough.
// Most of the auth-related logic is handled by the SDK
final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

// Note how it is totally possible to append custom logic or notifiers in between
// I personally don't like to overcomplicate things, but the sky's the limit!

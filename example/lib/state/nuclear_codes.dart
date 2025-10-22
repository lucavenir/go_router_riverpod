import 'package:example/utils/cache_for.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:time/time.dart';

part 'nuclear_codes.g.dart';

/// A simple provider that fetches a list of nuclear codes after a short delay
@riverpod
FutureOr<List<(IconData, String)>> nuclearCodes(Ref ref) async {
  // A proper mock of a simple request. I guess requesting nuclear codes is simple.
  await Future<void>.delayed(800.milliseconds);

  final result = [
    (Icons.one_k, 'Wow, this looks totally safe; click and see the nuclear code!'),
    (Icons.two_k, 'Wow, this looks totally safe; click and see the nuclear code!'),
    (Icons.three_k, 'Wow, this looks totally safe; click and see the nuclear code!'),
    (Icons.four_k, 'Uhm... do we *actually* want to see these codes?'),
    (Icons.five_k, 'Uhm... do we *actually* want to see these codes?'),
    (Icons.six_k, 'Uhm... do we *actually* want to see these codes?'),
    (Icons.seven_k, 'Uhm... do we *actually* want to see these codes?'),
    (Icons.eight_k, 'Ok, this is WAY too hot to handle.'),
    (Icons.nine_k, 'Ok, this is WAY too hot to handle.'),
    (Icons.ten_k, 'Ok, this is WAY too hot to handle.'),
  ];

  // Nukes are dangerous - I guess - so let's cache less time
  ref.cacheFor(10.seconds);

  return result;
}

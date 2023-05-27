import 'package:example/utils/cache_for.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nuclear_codes.g.dart';

@riverpod
FutureOr<List<(IconData, String)>> nuclearCodes(NuclearCodesRef ref) async {
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

  ref.cacheFor(10.seconds); // Nukes are dangerous - I guess - so let's cache less time
  return result;
}

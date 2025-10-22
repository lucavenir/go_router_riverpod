import 'package:example/utils/cache_for.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:time/time.dart';

part 'cute_rabbits.g.dart';

/// A simple provider that fetches a list of cute rabbits after a short delay
@riverpod
FutureOr<List<(IconData, String)>> cuteRabbits(Ref ref) async {
  // A proper mock of a simple request. I guess adopting a rabbit is simple.
  await Future<void>.delayed(800.milliseconds);

  final result = [
    (Icons.cruelty_free, 'A fluffy, cute, rabbit.'),
    (Icons.cruelty_free_outlined, 'Wow, this looks even fluffier!'),
    (Icons.cruelty_free_sharp, "Why must I choose, I want 'em all!"),
    (Icons.cruelty_free_rounded, 'This is all puffy 😍'),
    (Icons.pets, 'Uhm... we also could see more pets...'),
    (Icons.flutter_dash, 'Oh. My. God.\nI. Want. This.'),
  ];

  ref.cacheFor(2.minutes);
  return result;
}

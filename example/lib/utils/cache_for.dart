import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

/// An extension on [Ref] that allows caching a provider for a given duration.
extension CacheFor on Ref {
  /// keeps the provider alive for at least [duration] from invocation.
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);

    onDispose(timer.cancel);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef SideEffect<T> = ({
  VoidCallback clear,
  ValueSetter<Future<T>> mutate,
  AsyncSnapshot<T?> snapshot,
});

SideEffect<T> useSideEffect<T>({bool preserveState = true}) {
  final effect = useState<Future<T>?>(null);
  final snapshot = useFuture<T?>(effect.value, preserveState: preserveState);
  void clear() => effect.value = null;
  void mutate(Future<T> future) => effect.value = future;
  return (
    clear: clear,
    mutate: mutate,
    snapshot: snapshot,
  );
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  const RiverpodLogger();
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
  provider: ${provider.name ?? provider.runtimeType},
  oldValue: ${previousValue ?? 'None'},
  newValue: ${newValue ?? 'None'}
}
''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}

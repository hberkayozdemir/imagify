import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagify/app/core/logger/app_logger_impl.dart';

class AppObserver implements ProviderObserver {
  @override
  void mayHaveChanged(ProviderBase provider) {
    AppLoggerImpl.log.i('${provider.name} may have changed.');
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    AppLoggerImpl.log.e('${provider.name} has been initiliazed.');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    AppLoggerImpl.log.e('${provider.name} has been disposed.');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    AppLoggerImpl.log.i(
        '${provider.name ?? provider.runtimeType} has change the to $newValue.');
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    AppLoggerImpl.log
        .e('${provider.name ?? provider.runtimeType} ERROR ON $stackTrace.');
  }
}

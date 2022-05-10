final _privateError = UnsupportedError('Use AppConfig() implementation');

class AppConfig {
  const factory AppConfig({
    required String serverBaseUrl,
    required String appName,
  }) = _AppConfig;

  const AppConfig.none();

  String get serverBaseUrl => throw _privateError;

  String get appName => throw _privateError;
}

class _AppConfig implements AppConfig {
  const _AppConfig({
    required this.serverBaseUrl,
    required this.appName,
  });

  @override
  final String serverBaseUrl;

  @override
  final String appName;
}

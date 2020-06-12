import 'dart:developer' as developer;

import 'package:sentry/sentry.dart';

const _dsn =
    "https://378512cee97b411eb8a6067b257cd0ff@o406731.ingest.sentry.io/5274786";

final _sentry = SentryClient(dsn: _dsn);

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> reportError(dynamic error, dynamic stackTrace) async {
  developer.log('Caught error: $error');

  if (isInDebugMode) {
    developer.log('$stackTrace');
  } else {
    final res = await _sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );

    if (!res.isSuccessful) {
      developer.log("Failed to report error to Sentry: ${res.error}");
    }
  }
}

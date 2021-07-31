import 'dart:async';
import 'dart:developer' as developer;

import 'package:eh_redux/database/database.dart';
import 'package:eh_redux/modules/app/widgets/app.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:eh_redux/utils/notification.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import 'tasks/handler.dart';

Future<void> callbackDispatcher() async {
  await _initializeMain();

  return runZonedGuarded(() async {
    final handler = BackgroundTaskHandler();

    Workmanager().executeTask(
        (taskName, inputData) => handler.handle(taskName, inputData));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

Future<void> main() async {
  await _initializeMain();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);

  runZonedGuarded(() async {
    final isolate = await Database.createIsolate();
    final database = Database.connect(await isolate.connect());

    Database.shareIsolate(isolate);

    runApp(App(
      database: database,
      preferences: await StreamingSharedPreferences.instance,
    ));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

Future<void> _initializeMain() async {
  _setupLogger();
  WidgetsFlutterBinding.ensureInitialized();
  _logMobxMainContext();
  await initializeFirebase();
  await initializeNotificationPlugin();
}

void _setupLogger() {
  if (kDebugMode) {
    Logger.root.level = Level.FINER;
  }

  Logger.root.onRecord.listen((event) {
    developer.log(
      event.message,
      time: event.time,
      name: event.loggerName,
      error: event.error,
      stackTrace: event.stackTrace,
      level: event.level.value,
    );
  });
}

void _logMobxMainContext() {
  final log = Logger('mobx');

  mainContext.spy((event) {
    log.finest('$event');
  });
}

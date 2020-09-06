import 'dart:async';
import 'dart:developer' as developer;

import 'package:eh_redux/modules/app/widgets/app.dart';
import 'package:eh_redux/utils/firebase.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';
import 'package:workmanager/workmanager.dart';

import 'tasks/handler.dart';

Future<void> callbackDispatcher() async {
  setupLogger();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  Workmanager.executeTask((taskName, inputData) async {
    return runZonedGuarded(() async {
      return backgroundTaskHandler(taskName, inputData);
    }, (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    });
  });
}

void main() {
  setupLogger();
  WidgetsFlutterBinding.ensureInitialized();
  logMobxMainContext();
  Workmanager.initialize(callbackDispatcher, isInDebugMode: kDebugMode);

  runZonedGuarded(() {
    runApp(const App());
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

void setupLogger() {
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

void logMobxMainContext() {
  final log = Logger('mobx');

  mainContext.spy((event) {
    log.finest('$event');
  });
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'notification.freezed.dart';

final notificationPlugin = FlutterLocalNotificationsPlugin();
final didReceiveNotificationSubject = BehaviorSubject<ReceivedNotification>();
final selectNotificationSubject = BehaviorSubject<String>();
NotificationAppLaunchDetails notificationAppLaunchDetails;

@freezed
abstract class ReceivedNotification with _$ReceivedNotification {
  const factory ReceivedNotification({
    @required int id,
    @required String title,
    @required String body,
    @required String payload,
  }) = _ReceivedNotification;
}

Future<void> initializeNotificationPlugin() async {
  notificationAppLaunchDetails =
      await notificationPlugin.getNotificationAppLaunchDetails();

  const androidSettings = AndroidInitializationSettings('app_icon');
  final iosSettings = IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification: (id, title, body, payload) async {
      didReceiveNotificationSubject.add(ReceivedNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ));
    },
  );
  final initSettings = InitializationSettings(androidSettings, iosSettings);

  await notificationPlugin.initialize(
    initSettings,
    onSelectNotification: (payload) async {
      selectNotificationSubject.add(payload);
    },
  );
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'notification.freezed.dart';

final notificationPlugin = FlutterLocalNotificationsPlugin();
final didReceiveNotificationSubject = BehaviorSubject<ReceivedNotification>();
final selectNotificationSubject = BehaviorSubject<String>();
NotificationAppLaunchDetails? notificationAppLaunchDetails;

@freezed
class ReceivedNotification with _$ReceivedNotification {
  const factory ReceivedNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
  }) = _ReceivedNotification;
}

Future<void> initializeNotificationPlugin() async {
  notificationAppLaunchDetails =
      await notificationPlugin.getNotificationAppLaunchDetails();

  final initSettings = InitializationSettings(
      android: const AndroidInitializationSettings('app_icon'),
      iOS: IOSInitializationSettings(
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
      ));

  await notificationPlugin.initialize(
    initSettings,
    onSelectNotification: (payload) async {
      if (payload != null) selectNotificationSubject.add(payload);
    },
  );
}

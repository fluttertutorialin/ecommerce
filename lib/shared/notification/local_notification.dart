import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  /// Create a [AndroidNotificationChannel] for heads up notifications
  static AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static initializeLocalNotification(
      {required void onNotificationPressed(Map<String, dynamic> data),
      required String icon}) async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(icon);
    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {

        });

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        return onSelectNotification(
            payload: payload, onData: onNotificationPressed);
      },
    );
  }

  static Future onSelectNotification({required String? payload, onData}) async {
    if (payload != null) {
      var jsonData = jsonDecode(payload);
      onData(jsonData);
    }
  }

  static Future? onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    print(title);
  }

  static showNotification(
      {required RemoteNotification notification,
      required Map<String, dynamic> payload,
      required String icon}) {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name, channel.description,
                icon: icon)),
        payload: jsonEncode(payload));
  }
}

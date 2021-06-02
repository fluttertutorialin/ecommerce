import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'local_notification.dart';

class FirebaseNotification {
  static initializeFCM(
      {required void onTokenChanged(String? token),
      required void onNotificationPressed(Map<String, dynamic> data),
      required String icon}) async {
    await LocalNotification.initializeLocalNotification(
        onNotificationPressed: onNotificationPressed, icon: icon);

    await Firebase.initializeApp();
    FirebaseMessaging.instance
        .getToken()
        .then((value) => onTokenChanged(value!));
    Stream<String> _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(onTokenChanged);

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        LocalNotification.showNotification(notification: notification, payload: message.data, icon: icon);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      onNotificationPressed(message.data);
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      onNotificationPressed(message.data);
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
  }
}

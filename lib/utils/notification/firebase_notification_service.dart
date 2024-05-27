import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification_service.dart';

class FirebaseNotificationService {
  static firebaseMessagingIntilization() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    ///App is terminated or close and user taps and it open app from terminated state
    messaging.getInitialMessage().then((message) {
      if (message != null) {}
    });

    ///App in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      if (message != null) {
        if (Platform.isAndroid) {
          ///Firebase not send heads up notification when app in foreground, for that use flutter local notification to display heads up notification
          LocalNotificationService.display(message);
        }
      }
    });

    ///App in background and user taps on notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});

    ///Heads ap notification for iOS
    messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    enableIOSNotifications();
  }

  static enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  /// This function called when app is in the background or terminated.
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}

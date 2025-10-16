import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notifications_mk/main.dart';

class FirebaseApi {
  // create an instance of FirebaseApi message
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotifications() async {
    // request permission from the user
    await _firebaseMessaging.requestPermission();

    // fetch the firebase FCM token for this device
    final fcmToken = await _firebaseMessaging.getToken();

    // initialize further settings for push notifications
    await initPushNotifications();
  }

  // function to handle permissions
  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }

    navigatorKey.currentState?.pushNamed('/notification', arguments: message);
  }

  // function to initialize foreground and background services
  Future<void> initPushNotifications() async {
    // handle the notifications of the app was terminated and opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notifications_mk/api/firebase_api.dart';
import 'package:notifications_mk/firebase_options.dart';
import 'package:notifications_mk/pages/home_page.dart';
import 'package:notifications_mk/pages/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Notifications',
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/notification': (context) => const NotificationPage(),
      },
      navigatorKey: navigatorKey,
    );
  }
}

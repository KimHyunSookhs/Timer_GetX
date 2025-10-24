import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch/push/local_push_notifications.dart';
import 'package:stop_watch/view/timer_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationService = NotificationService();
  await notificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: TimerView(),
    );
  }
}

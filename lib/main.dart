import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch/controller/navigation_controller.dart';
import 'package:stop_watch/push/local_push_notifications.dart';
import 'package:stop_watch/view/bottom_navigation_bar.dart';
import 'package:stop_watch/view/stop_watch_view.dart';
import 'package:stop_watch/view/timer_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationService = NotificationService();
  await notificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static List<Widget> tabPages = <Widget>[
    TimerView(), // 외부 클래스로 정의
    StopWatchView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stop Watch App',
      // GetMaterialApp의 home 속성에 Scaffold를 가진 화면을 연결합니다.
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = Get.put(NavigationController()); // 컨트롤러 주입
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(child: MyApp.tabPages[controller.currentIndex.value]),
      ),
      bottomNavigationBar: BottomNavigationBarScaffold(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch/controller/navigation_controller.dart';

class BottomNavigationBarScaffold extends GetView<NavigationController> {
  const BottomNavigationBarScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: controller.changeTab,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orangeAccent,
        selectedLabelStyle: TextStyle(color: Colors.orangeAccent),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: controller.currentIndex.value,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: '스톱워치'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: '스톱워치'),
        ],
      ),
    );
  }
}

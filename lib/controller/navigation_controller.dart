import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;

  static NavigationController get to => Get.find();

  void changeTab(int index) {
    currentIndex.value = index;
  }
}

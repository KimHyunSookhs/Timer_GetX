import 'dart:async';

import 'package:get/get.dart';
import 'package:stop_watch/controller/push_controller.dart';
import 'package:stop_watch/push/local_push_notifications.dart';
import 'package:stop_watch/status/time_status.dart';
import 'package:stop_watch/status/timer_status.dart';

class TimerController extends GetxController {
  final RxInt seconds = 0.obs;
  final isRunning = false.obs;
  final timerStatus = <TimerStatus>[].obs;
  final timeStatus = <TimeStatus>[].obs;
  int maxSecond = 60;

  RxInt remainingSecond = 60.obs;
  late Timer timer;

  final pushController = Get.put(PushController());

  @override
  void onInit() {
    super.onInit();
    timeStatus.value = TimeStatus.values;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSecond > 0) {
        isRunning.value = true;
        remainingSecond.value--;
        update();
      } else {
        isRunning.value = false;
        NotificationService().showNotification(remainingSecond.value);
        timer.cancel();
        update();
      }
    });
  }

  //실행중이면 timer캔슬, false일때는 start
  void pausedTimer() {
    if (isRunning.value) {
      isRunning.value = !isRunning.value;
      timer.cancel();
      update();
    } else {
      startTimer();
      update();
    }
  }

  void resetTimer() {
    timer.cancel();
    isRunning.value = false;
    maxSecond = 60;
    remainingSecond.value = 60;
    update();
  }

  setTime(TimeStatus status) {
    isRunning.value = false;
    maxSecond = status.seconds;
    remainingSecond.value = status.seconds;
    timer.cancel();
    update();
  }
}

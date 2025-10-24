import 'dart:async';

import 'package:get/get.dart';
import 'package:stop_watch/status/timer_status.dart';

class TimerController extends GetxController {
  final RxInt seconds = 0.obs;
  final isRunning = false.obs;
  final timerStatus = <TimerStatus>[].obs;
  final int maxSecond = 30;

  RxInt remainingSecond = 30.obs;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSecond > 0) {
        isRunning.value = true;
        remainingSecond--;
        update();
      } else {
        timer.cancel();
        update();
      }
    });
  }

  //실행중이면 timer캔슬, false일때는 start
  void pausedTimer() {
    if (isRunning.value) {
      timer.cancel();
      update();
    } else {
      startTimer();
      update();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }
}

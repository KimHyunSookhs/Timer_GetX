import 'dart:async';

import 'package:get/get.dart';
import 'package:stop_watch/timer_status.dart';

class TimerController extends GetxController{
  final RxInt seconds = 0.obs;
  final isRunning = false.obs;
  final timerStatus = <TimerStatus>[].obs;
  static const maxSecond = 2500;
  int remainingSecond = maxSecond;
  late Timer timer;

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(remainingSecond >0){
        remainingSecond--;
      }else {
        timer.cancel();
      }
    });
  }

  void pausedTimer(){
    if(isRunning.value){
         timer.cancel();
    }else{
      startTimer();
    }
  }

}
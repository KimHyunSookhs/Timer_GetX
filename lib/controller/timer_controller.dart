import 'dart:async';

import 'package:get/get.dart';
import 'package:stop_watch/timer_status.dart';

class TimerController extends GetxController{
  final RxInt seconds = 0.obs;
  final RxBool isRunning = false.obs;
  final timerStatus = <TimerStatus>[].obs;

  late Timer timer;

}
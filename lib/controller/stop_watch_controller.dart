import 'dart:async';

import 'package:get/get.dart';

class StopWatchController extends GetxController {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  final Rx<String> _elapsedTime = '00:00:00'.obs;
  RxBool isRunning = false.obs;

  Rx<String> get elapsedTime => _elapsedTime;

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  void startTimer() {
    stopwatch.start();
    isRunning.value = !isRunning.value;
    update();
    timer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      update();
      _elapsedTime.value = _formatTime(stopwatch.elapsedMilliseconds);
    });
  }

  void stopTimer() {
    stopwatch.stop();
    isRunning.value = false;
    update();
  }

  void resetTimer() {
    stopwatch.reset();
    stopwatch.stop();
    isRunning.value = false;
    update();
    _elapsedTime.value = '00:00:00';
  }

  @override
  void dispose() {
    stopwatch.stop();
    timer?.cancel();
    super.dispose();
  }
}

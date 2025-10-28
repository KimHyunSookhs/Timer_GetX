import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch/controller/stop_watch_controller.dart';

class StopWatchView extends StatefulWidget {
  const StopWatchView({super.key});

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  final StopWatchController stopWatchController = Get.put(
    StopWatchController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetX<StopWatchController>(
          builder: (_) {
            return Container(
              padding: EdgeInsets.all(20),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${stopWatchController.elapsedTime}',
                    style: TextStyle(color: Colors.white, fontSize: 55),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          stopWatchController.isRunning.value
                              ? stopWatchController.stopTimer()
                              : stopWatchController.startTimer();
                        },
                        child: Text(
                          stopWatchController.isRunning.value ? '멈춤' : '시작',
                          style: TextStyle(
                            color: stopWatchController.isRunning.value
                                ? Colors.red
                                : Colors.green,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          stopWatchController.resetTimer();
                        },
                        child: Text(
                          '초기화',
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

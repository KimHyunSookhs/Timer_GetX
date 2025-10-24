import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch/controller/timer_controller.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  final TimerController timerController = Get.put(TimerController());

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int sec = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          color: Colors.black,
          child: Align(
            alignment: Alignment.center,
            child: GetX<TimerController>(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('25분간 집중해보기', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.cyan,
                            strokeWidth: 20,
                            value:
                                timerController.remainingSecond /
                                timerController.maxSecond,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '남은시간',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      formatTime(
                                        timerController.remainingSecond.value,
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    timerController.pausedTimer();
                                  },
                                  icon: timerController.isRunning.value
                                      ? Icon(
                                          Icons.stop,
                                          size: 100,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.play_arrow,
                                          size: 100,
                                          color: Colors.white,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 60,
                      child: ListView.separated(
                        itemCount: timerController.timeStatus.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.orangeAccent,
                            child: TextButton(
                              onPressed: () {
                                timerController.setTime(
                                  timerController.timeStatus[index],
                                );
                                print(timerController.timeStatus[index].value);
                              },
                              child: Text(
                                '${timerController.timeStatus[index].value}분',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

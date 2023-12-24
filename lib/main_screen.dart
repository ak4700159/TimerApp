import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

enum TimerStatus { running, paused, stopped, resting}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  static const WORK_SECONDS = 25;
  static const REST_SECONDS = 5;

  late TimerStatus _timerStatus;
  late int _timer;
  late int _count;

  final List<Widget> _runningButtons = [
    ElevatedButton(
      onPressed: () {},
      child: const Text(
        1 == 2 ? '계속하기' : '일시중지',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ),
    const SizedBox(
      width: 30,
    ),
    ElevatedButton(
      onPressed: () {},
      child: const Text(
        '포기하기',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
    ),
  ];

  final List<Widget> _stoppedButtons = [
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: const BeveledRectangleBorder(
          side: BorderSide(
            width: 1,
          ),
        ),
      ),
      child: const Text(
        '시작하기',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timerStatus = TimerStatus.stopped;
    _timer = WORK_SECONDS;
    _count = 0;
  }

  void run(){
    setState(() {
      _timerStatus = TimerStatus.running;
      runTimer();
    });
  }

  void rest(){
    setState(() {
      _timerStatus = TimerStatus.resting;
      _timer = REST_SECONDS;
    });
  }

  void pause(){
    setState(() {
      _timerStatus = TimerStatus.paused;
    });
  }

  void resume(){
    run();
  }

  void stop(){
    setState(() {
      _timer = WORK_SECONDS;
      _timerStatus = TimerStatus.stopped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '타이머',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Colors.red),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '00:00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(50.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 1 == 2
                  ? const []
                  : 1 == 2
                      ? _stoppedButtons
                      : _runningButtons,
            ),
          ],
        ),
      ),
    );
  }
}

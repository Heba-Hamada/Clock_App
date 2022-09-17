import 'package:flutter/material.dart';
import 'package:flutter_application_2/clockapp/coutemdata.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class stopwatch extends StatefulWidget {
  const stopwatch({Key? key}) : super(key: key);

  @override
  State<stopwatch> createState() => _stopwatchState();
}

class _stopwatchState extends State<stopwatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2F41),
        title: Text(
          'StopWatch',
          style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: CustomColors.primaryTextColor,
              fontSize: 24),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snapshot) {
                  final value = snapshot.data;
                  final displayTime =
                      StopWatchTimer.getDisplayTime(value!, hours: _isHours);

                  return Text(
                    displayTime,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    startButton(),
                    const SizedBox(
                      width: 40,
                    ),
                    stopButton(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              resetButton(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton startButton() {
    return ElevatedButton(
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.start);
      },
      child: const Text('Start'),
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 255, 158, 190),
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  ElevatedButton stopButton() {
    return ElevatedButton(
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
      },
      child: const Text('Stop'),
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 183, 216, 243),
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  ElevatedButton resetButton() {
    return ElevatedButton(
      onPressed: () {
        _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
      },
      child: const Text('Reset'),
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}

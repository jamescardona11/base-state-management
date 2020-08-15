import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final List<String> timeLap = [];

  final valueInitial = 60;
  bool actionGo = false;
  int timeText = 60;
  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeText.toString(),
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionText(
                  text: 'Reset',
                  onPressed: () {
                    timer?.cancel();
                    timeText = valueInitial;
                    timeLap.clear();
                    actionGo = false;
                    setState(() {});
                    //startTimer();
                  },
                ),
                _ActionButton(
                  icon: actionGo ? Icons.stop : Icons.play_arrow,
                  onPressed: () {
                    setState(() {
                      actionGo = !actionGo;
                    });
                    if (actionGo) {
                      timeLap.clear();
                      startTimer();
                    } else {
                      timer?.cancel();
                    }
                  },
                ),
                _ActionText(
                  text: 'Lap',
                  onPressed: () {
                    int time = valueInitial - timeText.toInt();
                    timeLap.add(time.toString());
                    setState(() {});
                  },
                  enable: actionGo,
                ),
              ],
            ),
            _LapList(timeLap: timeLap),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      setState(() {
        if (timeText < 1) {
          timer.cancel();
        } else {
          timeText -= 1;
        }
      });
    });
  }
}

class _LapList extends StatelessWidget {
  const _LapList({
    Key key,
    @required this.timeLap,
  }) : super(key: key);

  final List<String> timeLap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: 450,
      ),
      child: ListView.builder(
        itemCount: timeLap.length,
        shrinkWrap: true,
        reverse: true,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '# $index',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 10),
                Text(
                  '${timeLap[index]} seg',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActionText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enable;

  const _ActionText({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enable
        ? Container(
            width: 120,
            child: InkWell(
              onTap: onPressed,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        : Container(
            width: 120,
          );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ActionButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Colors.teal,
      child: Icon(
        icon,
        size: 30.0,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}

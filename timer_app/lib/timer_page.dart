import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  final timeLap = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '00:00',
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
                  onPressed: () {},
                  enable: true,
                ),
                _ActionButton(
                  icon: Icons.play_arrow,
                  onPressed: () {},
                ),
                _ActionText(
                  text: 'Lap',
                  onPressed: () {},
                  enable: true,
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              height: 250,
              color: Colors.red,
              child: ListView.builder(
                itemCount: timeLap.length,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
          ],
        ),
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
        ? InkWell(
            onTap: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        : Container();
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

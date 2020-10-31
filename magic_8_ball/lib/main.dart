import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(home: Ballpage()),
  );
}

class Ballpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: Center(child: Text('Ask Me Anything')),
        backgroundColor: Colors.blue[900],
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballnumber = 1;
  void balldisplay() {
    setState(
      () {
        ballnumber = Random().nextInt(5) + 1;
        print('ballnumber=$ballnumber');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          balldisplay();
        },
        child: Image(image: AssetImage("images/ball$ballnumber.png")),
      ),
    );
  }
}

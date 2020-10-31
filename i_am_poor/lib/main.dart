import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('I am poor :('),
            shadowColor: Colors.amber,
            brightness: Brightness.light,
            backgroundColor: Colors.lightBlue,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.purple,
                  displayColor: Colors.amber,
                )),
        body: Center(
          child: Image(
            image: AssetImage('images/icons8-poor-48.png'),
          ),
        ),
      ),
    );
  }
}

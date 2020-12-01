import 'package:flutter/material.dart';

class Tasktile extends StatelessWidget {
  final bool ischecked;
  final String tasktitle;
  final Function checkboxcallback;
  final Function longpresscallback;
  Tasktile(
      {this.ischecked,
      this.tasktitle,
      this.checkboxcallback,
      this.longpresscallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpresscallback,
      title: Text(
        tasktitle,
        style: TextStyle(
          decoration: ischecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: ischecked,
        onChanged: checkboxcallback,
      ),
    );
  }
}

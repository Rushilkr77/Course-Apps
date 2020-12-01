import 'package:flutter/material.dart';

import 'package:todoey/models/task_data.dart';

import 'package:provider/provider.dart';

class Addtaskscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newtasktitle;
    return Container(
      color: Color(0XFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newvalue) {
                newtasktitle = newvalue;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
                Provider.of<Taskdata>(context, listen: false)
                    .addtask(newtasktitle);
                Navigator.pop(context);
              },
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

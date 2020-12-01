import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class Taskslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Taskdata>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return Tasktile(
              tasktitle: task.name,
              ischecked: task.isdone,
              checkboxcallback: (checkboxstate) {
                taskdata.updatetask(task);
              },
              longpresscallback: () {
                taskdata.deletetask(task);
              },
            );
          },
          itemCount: taskdata.taskcount,
        );
      },
    );
  }
}

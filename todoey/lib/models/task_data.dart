import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class Taskdata extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Milk'),
    Task(name: 'Eggs'),
    Task(name: 'Bread'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskcount {
    return _tasks.length;
  }

  void addtask(String newtasktitle) {
    final task = Task(name: newtasktitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updatetask(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deletetask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

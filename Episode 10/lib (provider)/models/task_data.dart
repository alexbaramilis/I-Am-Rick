import 'package:flutter/foundation.dart';
import 'package:iamrick/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = sampleTasks();

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

//  List<Task> getTasks() => _tasks;

//  Task getTask(int index) => _tasks[index];

  int numberOfTasks() => _tasks.length;

  void addTask(String text) {
    _tasks.add(Task(text));
    notifyListeners();
  }

  void toggleCheck(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  static List<Task> sampleTasks() {
    return [
      Task('Clear the walkers from the gate.'),
      Task('Go over the inventory.'),
      Task('Inspect the walls.'),
      Task('Clean my revolver.'),
      Task('Interrogate the newcomers.'),
      Task('Plan the new supply routes.'),
      Task('Give a motivational speech.'),
    ];
  }
}

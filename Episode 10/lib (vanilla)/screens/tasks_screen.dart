import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:iamrick/components/dashboard.dart';
import 'package:iamrick/components/task_list.dart';
import 'package:iamrick/screens/add_task_screen.dart';
import 'package:iamrick/models/task.dart';

// After Provider

//class TasksScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: kColourPrimary,
//        child: Icon(Icons.add, size: 36.0),
//        onPressed: () {
//          showModalBottomSheet(
//            backgroundColor: Colors.transparent,
//            isScrollControlled: true,
//            context: context,
//            builder: (context) => SingleChildScrollView(child: AddTaskScreen()),
//          );
//        },
//      ),
//      body: Column(
//        children: <Widget>[
//          Dashboard(),
//          TaskList(),
//        ],
//      ),
//    );
//  }
//}

// Before Provider

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = Task.sampleTasks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColourPrimary,
        child: Icon(Icons.add, size: 36.0),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: AddTaskScreen(
                onTaskAdded: (String text) {
                  setState(() => tasks.add(Task(text)));
                },
              ),
            ),
          );
        },
      ),
      body: Column(
        children: <Widget>[
          Dashboard(numberOfTasks: tasks.length),
          TaskList(
            tasks: tasks,
            onTaskTapped: (int index) => setState(
              () => tasks[index].isCompleted = !tasks[index].isCompleted,
            ),
            onTaskDeleted: (int index) => setState(() => tasks.removeAt(index)),
          ),
        ],
      ),
    );
  }
}

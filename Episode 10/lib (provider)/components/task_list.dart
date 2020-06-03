import 'package:flutter/material.dart';
import 'package:iamrick/components/bottom_padded_card.dart';
import 'package:iamrick/components/task_list_item.dart';
import 'package:provider/provider.dart';
import 'package:iamrick/models/task_data.dart';
import 'package:iamrick/models/task.dart';

// After Provider

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, data, child) {
      return Expanded(
        child: BottomPaddedCard(
          child: ListView.builder(
            padding: EdgeInsets.all(20.0),
            itemCount: data.numberOfTasks(),
            itemBuilder: (context, index) {
              return TaskListItem(
                title: data.getTask(index).name,
                isChecked: data.getTask(index).isCompleted,
                onItemTapped: () => data.toggleCheck(index),
                onItemDragged: () => data.deleteTask(index),
              );
            },
          ),
        ),
      );
    });
  }
}

// Before Provider

//class TaskList extends StatelessWidget {
//  final List<Task> tasks;
//  final Function onTaskTapped;
//  final Function onTaskDragged;
//
//  TaskList({
//    @required this.tasks,
//    @required this.onTaskTapped,
//    @required this.onTaskDragged,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Expanded(
//      child: BottomPaddedCard(
//        child: ListView.builder(
//          padding: EdgeInsets.all(20.0),
//          itemCount: tasks.length,
//          itemBuilder: (context, index) {
//            return TaskListItem(
//              title: tasks[index].name,
//              isChecked: tasks[index].isCompleted,
//              onItemTapped: () => onTaskTapped(index),
//              onItemDragged: () => onTaskDragged(index),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}

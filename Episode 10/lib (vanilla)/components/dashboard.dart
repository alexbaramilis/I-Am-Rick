import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:iamrick/models/task_data.dart';

// After Provider

//class Dashboard extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      bottom: false,
//      child: Column(
//        children: <Widget>[
//          SizedBox(height: 20.0),
//          CircleAvatar(
//            radius: 27.0,
//            backgroundColor: Colors.white,
//            child: Icon(
//              Icons.list,
//              size: 39.0,
//              color: kColourPrimary,
//            ),
//          ),
//          SizedBox(height: 20.0),
//          Text("Rick's To-Do List", style: kTextStyleTitle),
//          SizedBox(height: 8.0),
//          Text(
//            "${Provider.of<TaskData>(context).numberOfTasks()} Tasks",
//            style: kTextStyleTasks,
//          ),
//          SizedBox(height: 10.0),
//        ],
//      ),
//    );
//  }
//}

// Before Provider

class Dashboard extends StatelessWidget {
  final int numberOfTasks;

  Dashboard({
    @required this.numberOfTasks,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          CircleAvatar(
            radius: 27.0,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.list,
              size: 39.0,
              color: kColourPrimary,
            ),
          ),
          SizedBox(height: 20.0),
          Text("Rick's To-Do List", style: kTextStyleTitle),
          SizedBox(height: 8.0),
          Text("$numberOfTasks Tasks", style: kTextStyleTasks),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

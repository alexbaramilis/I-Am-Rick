import 'package:flutter/material.dart';
import 'package:iamrick/screens/tasks_screen.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:iamrick/models/task_data.dart';

void main() => runApp(MyApp());

// After Provider

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: kColourPrimary,
          scaffoldBackgroundColor: kColourPrimary,
        ),
        home: TasksScreen(),
      ),
    );
  }
}

// Before Provider

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primaryColor: kColourPrimary,
//        scaffoldBackgroundColor: kColourPrimary,
//      ),
//      home: TasksScreen(),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:iamrick/components/bottom_padded_card.dart';
import 'package:provider/provider.dart';
import 'package:iamrick/models/task_data.dart';

// After Provider

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String text;

  @override
  Widget build(BuildContext context) {
    return BottomPaddedCard(
      padding: EdgeInsets.only(
          left: 20.0,
          top: 30.0,
          right: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            style: kTextStyleTitleDark,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.0),
          TextField(
            cursorColor: kColourPrimary,
            style: kTextStyleListItem,
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            minLines: 1,
            maxLines: 3,
            onChanged: (String value) => text = value,
          ),
          SizedBox(height: 20.0),
          FlatButton(
            color: kColourPrimary,
            padding: EdgeInsets.symmetric(vertical: 12.0),
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(text);
              Navigator.pop(context);
            },
            child: Text('Add', style: kTextStyleAddButton),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

// Before Provider

//class AddTaskScreen extends StatefulWidget {
//  final Function onTaskAdded;
//
//  AddTaskScreen({@required this.onTaskAdded});
//
//  @override
//  _AddTaskScreenState createState() => _AddTaskScreenState();
//}
//
//class _AddTaskScreenState extends State<AddTaskScreen> {
//  String text;
//
//  @override
//  Widget build(BuildContext context) {
//    return BottomPaddedCard(
//      padding: EdgeInsets.only(
//          left: 20.0,
//          top: 30.0,
//          right: 20.0,
//          bottom: MediaQuery.of(context).viewInsets.bottom),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          Text(
//            'Add Task',
//            style: kTextStyleTitleDark,
//            textAlign: TextAlign.center,
//          ),
//          SizedBox(height: 12.0),
//          TextField(
//            cursorColor: kColourPrimary,
//            style: kTextStyleListItem,
//            textCapitalization: TextCapitalization.sentences,
//            autofocus: true,
//            minLines: 1,
//            maxLines: 3,
//            onChanged: (String value) {
//              text = value;
//            },
//          ),
//          SizedBox(height: 20.0),
//          FlatButton(
//            color: kColourPrimary,
//            padding: EdgeInsets.symmetric(vertical: 12.0),
//            onPressed: () {
//              widget.onTaskAdded(text);
//              Navigator.pop(context);
//            },
//            child: Text('Add', style: kTextStyleAddButton),
//          ),
//          SizedBox(height: 20.0),
//        ],
//      ),
//    );
//  }
//}

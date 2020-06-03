import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';

class TaskListItem extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onItemTapped;
  final Function onItemDragged;

  TaskListItem({
    @required this.title,
    @required this.isChecked,
    @required this.onItemTapped,
    @required this.onItemDragged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTapped,
      onHorizontalDragEnd: (details) => onItemDragged(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              isChecked ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            SizedBox(width: 16.0),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  title,
                  style: isChecked
                      ? kTextStyleListItemChecked
                      : kTextStyleListItem,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

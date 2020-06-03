import 'package:flutter/material.dart';

final kColourPrimary = Colors.red[800];
final kColourBackground = Colors.lightGreen[200];

const kTextStyleTitle = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  color: Colors.white,
  fontSize: 27.0,
);
final kTextStyleTitleDark = kTextStyleTitle.copyWith(color: Colors.black);
const kTextStyleTasks = TextStyle(
  fontFamily: 'Courier-Prime',
  color: Colors.white,
  fontSize: 20.0,
);
const kTextStyleListItem = TextStyle(
  fontFamily: 'Courier-Prime',
  color: Colors.black,
  fontSize: 20.0,
);
const kTextStyleListItemChecked = TextStyle(
  fontFamily: 'Courier-Prime',
  color: Colors.black,
  fontSize: 20.0,
  decoration: TextDecoration.lineThrough,
);
const kTextStyleAddButton = TextStyle(
  fontFamily: 'Courier-Prime',
  color: Colors.white,
  fontSize: 23.0,
);

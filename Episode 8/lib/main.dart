import 'package:flutter/material.dart';
import 'package:iamrick/screens/main_screen.dart';
import 'package:iamrick/utilities/constants.dart';

void main() => runApp(RicksDEX());

class RicksDEX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kColourPrimary,
        scaffoldBackgroundColor: kColourBackgroundDarker,
      ),
      home: MainScreen(),
    );
  }
}

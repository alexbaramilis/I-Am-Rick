import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';
import 'package:i_am_rick/screens/input_page.dart';

void main() => runApp(ProteinIntakeCalculator());

class ProteinIntakeCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kColourPrimary,
        scaffoldBackgroundColor: kColourBackground,
      ),
      home: InputPage(),
    );
  }
}

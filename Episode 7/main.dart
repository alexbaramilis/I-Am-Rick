import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:iamrick/screens/stats_screen.dart';

void main() => runApp(CoronavirusTracker());

class CoronavirusTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kColourPrimary,
        scaffoldBackgroundColor: kColourBackground,
      ),
      home: StatsScreen(),
    );
  }
}

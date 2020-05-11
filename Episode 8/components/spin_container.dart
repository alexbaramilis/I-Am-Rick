import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinContainer extends StatelessWidget {
  final double height;

  SpinContainer({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      color: kColourBackgroundDark,
      child: SpinKitWave(color: kColourPrimary, size: 30),
    );
  }
}

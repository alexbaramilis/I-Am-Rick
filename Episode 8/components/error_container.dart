import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';

class ErrorContainer extends StatelessWidget {
  final double height;
  final String errorMessage;

  ErrorContainer({
    @required this.height,
    @required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      color: kColourBackgroundDark,
      child: Text(
        errorMessage,
        style: kTextStyleError,
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';

class RickButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  RickButton({
    @required this.label,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(label, style: kTextStyleText),
        onPressed: onPressed,
        color: kColourButton,
        textColor: kColourButtonText,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  BottomButton({
    @required this.label,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(label, style: kTextStyleText),
        onPressed: onPressed,
        color: kColourWrapCardButtonSelected,
        textColor: kColourWrapCardButtonTextSelected,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      ),
    );
  }
}

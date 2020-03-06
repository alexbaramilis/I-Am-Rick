import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';

class WrapCardButton extends StatelessWidget {
  final int buttonIndex;
  final String buttonLabel;
  final bool isSelected;
  final Function onPressed;

  WrapCardButton({
    @required this.buttonIndex,
    @required this.buttonLabel,
    this.isSelected = false,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(buttonLabel, style: kTextStyleText),
      onPressed: () {
        onPressed(buttonIndex);
      },
      color: isSelected
          ? kColourWrapCardButtonSelected
          : kColourWrapCardButtonDeselected,
      textColor: isSelected
          ? kColourWrapCardButtonTextSelected
          : kColourWrapCardButtonTextDeselected,
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 20.0,
      ),
    );
  }
}

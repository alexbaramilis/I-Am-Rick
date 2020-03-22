import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  ActionButton({
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
        size: 32.0,
      ),
      shape: CircleBorder(),
      elevation: 0,
      fillColor: kColourPrimary,
      padding: EdgeInsets.all(16.0),
    );
  }
}

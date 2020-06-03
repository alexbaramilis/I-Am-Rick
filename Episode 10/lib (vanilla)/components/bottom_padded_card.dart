import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';

class BottomPaddedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  BottomPaddedCard({
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding != null
          ? padding.copyWith(
              bottom: padding.bottom + MediaQuery.of(context).padding.bottom)
          : EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: kColourBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: child,
    );
  }
}

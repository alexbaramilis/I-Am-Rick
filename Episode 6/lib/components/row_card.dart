import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';

class RowCard extends StatelessWidget {
  final bool isFirstRow;
  final Widget child;

  RowCard({
    this.isFirstRow = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.fromLTRB(8.0, isFirstRow ? 8.0 : 0.0, 8.0, 8.0),
      decoration: BoxDecoration(
        color: kColourRowCard,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

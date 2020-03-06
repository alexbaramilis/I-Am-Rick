import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';
import 'package:i_am_rick/components/row_card.dart';

class ResultCard extends StatelessWidget {
  final bool isFirstRow;

  final String labelName;
  final int labelValue;
  final String labelUnits;
  final String additionalText;

  ResultCard({
    this.isFirstRow = false,
    @required this.labelName,
    @required this.labelValue,
    @required this.labelUnits,
    this.additionalText,
  });

  @override
  Widget build(BuildContext context) {
    return RowCard(
      isFirstRow: isFirstRow,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 15.0),
        child: Column(
          children: <Widget>[
            Text(
              labelName,
              style: kTextStyleText,
              textAlign: TextAlign.center,
            ),
            if (labelValue != null)
              Text(
                labelValue.toString(),
                style: kTextStyleValue,
              ),
            if (labelValue != null)
              Text(
                labelUnits,
                style: kTextStyleLabel,
              ),
            if (additionalText != null)
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  additionalText,
                  style: kTextStyleText,
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}

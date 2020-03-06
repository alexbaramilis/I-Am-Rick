import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';
import 'package:i_am_rick/components/row_card.dart';
import 'package:i_am_rick/components/wrap_card_button.dart';

class WrapCard extends StatelessWidget {
  final bool isFirstRow;
  final String labelName;
  final List<String> buttonNames;
  final List<bool> buttonStates;
  final Function onButtonPressed;

  WrapCard({
    this.isFirstRow = false,
    @required this.labelName,
    @required this.buttonNames,
    @required this.buttonStates,
    @required this.onButtonPressed,
  });

  List<Widget> layoutButtons() {
    List<Widget> children = [];
    for (int i = 0; i < buttonNames.length; i++) {
      children.add(WrapCardButton(
        buttonIndex: i,
        buttonLabel: buttonNames[i],
        isSelected: buttonStates[i],
        onPressed: onButtonPressed,
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return RowCard(
      isFirstRow: isFirstRow,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              labelName,
              style: kTextStyleLabel,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12.0,
              runSpacing: 12.0,
              children: layoutButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

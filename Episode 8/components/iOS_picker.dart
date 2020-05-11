import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:flutter/cupertino.dart';

class IOSPicker extends StatelessWidget {
  final String selectedTradingPair;
  final Function onPickerChanged;

  IOSPicker({
    @required this.selectedTradingPair,
    @required this.onPickerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return buildPicker();
  }

  CupertinoPicker buildPicker() {
    List<Text> pickerItems = [];
    for (String tradingPair in kTradingPairs) {
      pickerItems.add(
        Text(
          tradingPair,
          style: kTextStyleTradingPair,
        ),
      );
    }
    return CupertinoPicker(
      itemExtent: 26.0,
      children: pickerItems,
      onSelectedItemChanged: (selectedItemIndex) {
        onPickerChanged(selectedItemIndex);
      },
      backgroundColor: kColourBackgroundDark,
    );
  }
}

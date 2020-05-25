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
      scrollController: FixedExtentScrollController(
          initialItem: kTradingPairs.indexOf(selectedTradingPair)),
      children: pickerItems,
      onSelectedItemChanged: (selectedItemIndex) {
        onPickerChanged(selectedItemIndex);
      },
      itemExtent: 26.0,
      backgroundColor: kColourBackgroundDark,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';

class AndroidDropdown extends StatelessWidget {
  final String selectedTradingPair;
  final Function onDropdownChanged;

  AndroidDropdown({
    @required this.selectedTradingPair,
    @required this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context) {
    return buildDropdown();
  }

  DropdownButton<String> buildDropdown() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];
    for (String tradingPair in kTradingPairs) {
      dropdownMenuItems.add(
        DropdownMenuItem(
          child: Text(
            tradingPair,
            style: kTextStyleTradingPair,
          ),
          value: tradingPair,
        ),
      );
    }
    return DropdownButton<String>(
      value: selectedTradingPair,
      items: dropdownMenuItems,
      onChanged: (value) {
        onDropdownChanged(value);
      },
      dropdownColor: kColourBackgroundDark,
    );
  }
}

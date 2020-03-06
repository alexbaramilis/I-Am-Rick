import 'package:flutter/material.dart';
import 'package:i_am_rick/constants.dart';
import 'package:i_am_rick/components/row_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliderCard extends StatelessWidget {
  final bool isFirstRow;

  final String labelName;
  final int labelValue;
  final String labelUnits;

  final double sliderMinimumValue;
  final double sliderMaximumValue;

  final Function onMinusButtonPressed;
  final Function onPlusButtonPressed;
  final Function onSliderChanged;

  SliderCard({
    this.isFirstRow = false,
    @required this.labelName,
    @required this.labelValue,
    @required this.labelUnits,
    @required this.sliderMinimumValue,
    @required this.sliderMaximumValue,
    @required this.onMinusButtonPressed,
    @required this.onPlusButtonPressed,
    @required this.onSliderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RowCard(
      isFirstRow: isFirstRow,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.minusCircle),
                  iconSize: kIconSize,
                  padding: EdgeInsets.only(left: 30.0),
                  color: kIconColour,
                  onPressed: onMinusButtonPressed,
                ),
                Column(
                  children: <Widget>[
                    Text(labelName, style: kTextStyleLabel),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(labelValue.toString(), style: kTextStyleValue),
                        Text(labelUnits, style: kTextStyleLabel),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.plusCircle),
                  iconSize: kIconSize,
                  padding: EdgeInsets.only(right: 30.0),
                  color: kIconColour,
                  onPressed: onPlusButtonPressed,
                ),
              ],
            ),
            Slider(
              min: sliderMinimumValue,
              max: sliderMaximumValue,
              value: labelValue.toDouble(),
              onChanged: (double newValue) {
                onSliderChanged(newValue);
              },
              activeColor: kColourSliderActive,
              inactiveColor: kColourSliderInactive,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:i_am_rick/calculator_model.dart';
import 'package:i_am_rick/constants.dart';
import 'package:i_am_rick/components/slider_card.dart';
import 'package:i_am_rick/components/wrap_card.dart';
import 'package:i_am_rick/components/bottom_button.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CalculatorModel model = CalculatorModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppBarMainTitle),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SliderCard(
              isFirstRow: true,
              labelName: 'HEIGHT',
              labelValue: model.height,
              labelUnits: 'cm',
              sliderMinimumValue: kMinimumHeight.toDouble(),
              sliderMaximumValue: kMaximumHeight.toDouble(),
              onMinusButtonPressed: () {
                setState(() {
                  model.height > kMinimumHeight
                      ? model.height -= 1
                      : model.height = kMinimumHeight;
                });
              },
              onPlusButtonPressed: () {
                setState(() {
                  model.height < kMaximumHeight
                      ? model.height += 1
                      : model.height = kMaximumHeight;
                });
              },
              onSliderChanged: (double newValue) {
                setState(() {
                  model.height = newValue.toInt();
                });
              },
            ),
            SliderCard(
              labelName: 'WEIGHT',
              labelValue: model.weight,
              labelUnits: 'kg',
              sliderMinimumValue: kMinimumWeight.toDouble(),
              sliderMaximumValue: kMaximumWeight.toDouble(),
              onMinusButtonPressed: () {
                setState(() {
                  model.weight > kMinimumWeight
                      ? model.weight -= 1
                      : model.weight = kMinimumWeight;
                });
              },
              onPlusButtonPressed: () {
                setState(() {
                  model.weight < kMaximumWeight
                      ? model.weight += 1
                      : model.weight = kMaximumWeight;
                });
              },
              onSliderChanged: (double newValue) {
                setState(() {
                  model.weight = newValue.toInt();
                });
              },
            ),
            WrapCard(
              labelName: 'ACTIVITY LEVEL',
              buttonNames: model.activityLevelNames,
              buttonStates: model.activityLevelStates,
              onButtonPressed: (int pressedButtonIndex) {
                setState(() {
                  for (int i = 0; i < model.activityLevelStates.length; i++) {
                    i == pressedButtonIndex
                        ? model.activityLevelStates[i] = true
                        : model.activityLevelStates[i] = false;
                  }
                });
              },
            ),
            WrapCard(
              labelName: 'FITNESS GOAL',
              buttonNames: model.fitnessGoalNames,
              buttonStates: model.fitnessGoalStates,
              onButtonPressed: (int pressedButtonIndex) {
                setState(() {
                  for (int i = 0; i < model.fitnessGoalStates.length; i++) {
                    i == pressedButtonIndex
                        ? model.fitnessGoalStates[i] = true
                        : model.fitnessGoalStates[i] = false;
                  }
                });
              },
            ),
            BottomButton(
              label: 'Calculate',
              onPressed: () {
                model.calculate();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(model: model),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

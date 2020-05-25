import 'package:flutter/material.dart';
import 'package:i_am_rick/calculator_model.dart';
import 'package:i_am_rick/constants.dart';
import 'package:i_am_rick/components/result_card.dart';
import 'package:i_am_rick/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final CalculatorModel model;

  ResultsPage({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppBarMainTitle),
      ),
      body: Column(
        children: <Widget>[
          ResultCard(
            isFirstRow: true,
            labelName: model.minimumResultLabel,
            labelValue: model.minimumProteinIntake,
            labelUnits: model.units,
          ),
          if (model.maximumProteinIntake != null)
            ResultCard(
              labelName: model.maximumResultLabel,
              labelValue: model.maximumProteinIntake,
              labelUnits: model.units,
              additionalText: model.maximumResultAdditionalLabel,
            ),
          if (model.additionalInfoLabel != null)
            ResultCard(
              labelName: model.additionalInfoLabel,
              labelValue: model.powerLifterProteinIntake,
              labelUnits: model.units,
              additionalText: model.additionalInfoAdditionalLabel,
            ),
          BottomButton(
            label: 'Recalculate',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

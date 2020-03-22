import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:fl_chart/fl_chart.dart';

class StackPie extends StatelessWidget {
  final int totalNumber;
  final int sickNumber;
  final int recoveredNumber;
  final int deadNumber;

  final double radius = 24;
  final bool showTitles = false;

  StackPie({
    @required this.totalNumber,
    @required this.sickNumber,
    @required this.recoveredNumber,
    @required this.deadNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, -0.14),
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('Total:', style: kTextStyleTotalLabel),
            SizedBox(height: 12),
            Text(
              kNumberFormat.format(totalNumber),
              style: kTextStyleTotalNumber,
            ),
          ],
        ),
        PieChart(
          PieChartData(
            startDegreeOffset: -90,
            borderData: FlBorderData(show: false),
            sections: [
              PieChartSectionData(
                value: sickNumber.toDouble(),
                color: kColourPieSick,
                radius: radius,
                showTitle: showTitles,
              ),
              PieChartSectionData(
                value: recoveredNumber.toDouble(),
                color: kColourPieRecovered,
                radius: radius,
                showTitle: showTitles,
              ),
              PieChartSectionData(
                value: deadNumber.toDouble(),
                color: kColourPieDead,
                radius: radius,
                showTitle: showTitles,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

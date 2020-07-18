import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

class Leaderboard extends StatelessWidget{
 Widget build(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width * 0.9,
      child: BezierChart(
        bezierChartScale: BezierChartScale.CUSTOM,
        xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
        series: const [
          BezierLine(
            data: const [
              DataPoint<double>(value: 10, xAxis: 0),
              DataPoint<double>(value: 130, xAxis: 5),
              DataPoint<double>(value: 50, xAxis: 10),
              DataPoint<double>(value: 150, xAxis: 15),
              DataPoint<double>(value: 75, xAxis: 20),
              DataPoint<double>(value: 0, xAxis: 25),
              DataPoint<double>(value: 5, xAxis: 30),
              DataPoint<double>(value: 45, xAxis: 35),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 2.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          snap: false,
          stepsYAxis: 20,
          displayYAxis: true,
          footerHeight: 10
        ),
      ),
    ),
  );
}
}
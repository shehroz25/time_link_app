import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String age;
  int? number;
  final charts.Color color;

  BarChartModel({
    required this.age,
    required this.number,
    required this.color,
  });
}
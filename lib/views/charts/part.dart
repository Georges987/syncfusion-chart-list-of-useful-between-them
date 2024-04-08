import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Part extends StatefulWidget {
  const Part({super.key});

  @override
  State<Part> createState() => _PartState();
}

class _PartState extends State<Part> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagramme circulaire'),
      ),
      body: SfCircularChart(
        title: const ChartTitle(text: 'Sales by sales person'),
        legend: const Legend(
            isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        series: _getDefaultPieSeries(),
      ),
    );
  }
}

List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
  return <PieSeries<ChartSampleData, String>>[
    PieSeries<ChartSampleData, String>(
        explode: true,
        explodeIndex: 0,
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'David', y: 13, text: 'David \n 13%'),
          ChartSampleData(x: 'Steve', y: 24, text: 'Steve \n 24%'),
          ChartSampleData(x: 'Jack', y: 25, text: 'Jack \n 25%'),
          ChartSampleData(x: 'Others', y: 38, text: 'Others \n 38%'),
        ],
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        startAngle: 90,
        endAngle: 90,
        dataLabelSettings: const DataLabelSettings(isVisible: true)),
  ];
}

class ChartSampleData {
  ChartSampleData({this.x, required this.y, this.text});
  final dynamic x;
  final num y;
  final String? text;
}

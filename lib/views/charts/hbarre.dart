import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HBar extends StatefulWidget {
  const HBar({super.key});

  @override
  State<HBar> createState() => _HBarState();
}

class _HBarState extends State<HBar> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material 3'),
      ),
      body: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: const ChartTitle(
            text: 'Population growth rate of the most populous countries'),
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
            axisLine: AxisLine(width: 0),
            labelFormat: '{value}%',
            majorTickLines: MajorTickLines(size: 0)),
        series: _getDefaultColumnSeries(),
        tooltipBehavior: _tooltipBehavior,
      ),
    );
  }
}

List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
  return <ColumnSeries<ChartSampleData, String>>[
    ColumnSeries<ChartSampleData, String>(
      dataSource: <ChartSampleData>[
        ChartSampleData(x: 'China', y: 0.541),
        ChartSampleData(x: 'Brazil', y: 0.818),
        ChartSampleData(x: 'Bolivia', y: 1.51),
        ChartSampleData(x: 'Mexico', y: 1.302),
        ChartSampleData(x: 'Egypt', y: 2.017),
        ChartSampleData(x: 'Mongolia', y: 1.683),
      ],
      xValueMapper: (ChartSampleData sales, _) => sales.x as String,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, textStyle: TextStyle(fontSize: 10)),
    )
  ];
}

class ChartSampleData {
  ChartSampleData({this.x, required this.y});
  final dynamic x;
  final num y;
}

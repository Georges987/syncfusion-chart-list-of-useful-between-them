import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBar extends StatefulWidget {
  const RadialBar({super.key});

  @override
  State<RadialBar> createState() => _RadialBarState();
}

class _RadialBarState extends State<RadialBar> {
  TooltipBehavior? _tooltipBehavior;
  List<ChartSampleData>? dataSources;
  List<CircularChartAnnotation>? _annotationSources;
  List<Color>? colors;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y%');
    dataSources = <ChartSampleData>[
      ChartSampleData(
          x: 'Vehicle',
          y: 62.70,
          text: '10%',
          pointColor: const Color.fromRGBO(69, 186, 161, 1.0)),
      ChartSampleData(
          x: 'Education',
          y: 29.20,
          text: '10%',
          pointColor: const Color.fromRGBO(230, 135, 111, 1.0)),
      ChartSampleData(
          x: 'Home',
          y: 85.20,
          text: '100%',
          pointColor: const Color.fromRGBO(145, 132, 202, 1.0)),
      ChartSampleData(
          x: 'Personal',
          y: 45.70,
          text: '100%',
          pointColor: const Color.fromRGBO(235, 96, 143, 1.0))
    ];
    _annotationSources = <CircularChartAnnotation>[
      CircularChartAnnotation(
        widget: CircleAvatar(
          child: Image.network(
            "https://cdn.pixabay.com/photo/2024/03/28/22/39/ai-generated-8661807_1280.png",
            width: 20,
            height: 20,
            color: const Color.fromRGBO(69, 186, 161, 1.0),
          ),
        ),
      ),
      CircularChartAnnotation(
        widget: CircleAvatar(
          child: Image.network(
            "https://cdn.pixabay.com/photo/2024/03/28/22/39/ai-generated-8661807_1280.png",
            width: 20,
            height: 20,
            color: const Color.fromRGBO(230, 135, 111, 1.0),
          ),
        ),
      ),
      CircularChartAnnotation(
        widget: CircleAvatar(
          child: Image.network(
            "https://cdn.pixabay.com/photo/2024/03/28/22/39/ai-generated-8661807_1280.png",
            width: 20,
            height: 20,
            color: const Color.fromRGBO(145, 132, 202, 1.0),
          ),
        ),
      ),
      CircularChartAnnotation(
        widget: Image.network(
          "https://cdn.pixabay.com/photo/2024/03/28/22/39/ai-generated-8661807_1280.png",
          width: 20,
          height: 20,
          color: const Color.fromRGBO(235, 96, 143, 1.0),
        ),
      ),
    ];
    colors = const <Color>[
      Color.fromRGBO(69, 186, 161, 1.0),
      Color.fromRGBO(230, 135, 111, 1.0),
      Color.fromRGBO(145, 132, 202, 1.0),
      Color.fromRGBO(235, 96, 143, 1.0)
    ];

    super.initState();
  }

  @override
  void dispose() {
    dataSources!.clear();
    _annotationSources!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(
        title: const ChartTitle(text: 'Percentage of loan closure'),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          legendItemBuilder:
              (String name, dynamic series, dynamic point, int index) {
            return SizedBox(
                height: 60,
                width: 150,
                child: Row(children: <Widget>[
                  SizedBox(
                      height: 75,
                      width: 65,
                      child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                          _annotationSources![index],
                        ],
                        series: <RadialBarSeries<ChartSampleData, String>>[
                          RadialBarSeries<ChartSampleData, String>(
                              animationDuration: 0,
                              dataSource: <ChartSampleData>[
                                dataSources![index]
                              ],
                              maximumValue: 100,
                              radius: '100%',
                              cornerStyle: CornerStyle.bothCurve,
                              xValueMapper: (ChartSampleData data, _) =>
                                  point.x as String,
                              yValueMapper: (ChartSampleData data, _) => data.y,
                              pointColorMapper: (ChartSampleData data, _) =>
                                  data.pointColor,
                              innerRadius: '70%',
                              pointRadiusMapper: (ChartSampleData data, _) =>
                                  data.text),
                        ],
                      )),
                  SizedBox(
                      width: 72,
                      child: Text(
                        point.x,
                        style: TextStyle(
                            color: colors![index], fontWeight: FontWeight.bold),
                      )),
                ]));
          },
        ),
        series: _getRadialBarCustomizedSeries(),
        tooltipBehavior: _tooltipBehavior,
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
              height: '90%',
              width: '90%',
              widget: CircleAvatar(
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2024/03/28/22/39/ai-generated-8661807_1280.png",
                  width: 100.0,
                  height: 100.0,
                ),
              )),
        ],
      ),
    );
  }
}

List<RadialBarSeries<ChartSampleData, String>> _getRadialBarCustomizedSeries() {
  return <RadialBarSeries<ChartSampleData, String>>[
    RadialBarSeries<ChartSampleData, String>(
      animationDuration: 0,
      maximumValue: 100,
      gap: '10%',
      radius: '100%',
      dataSource: <ChartSampleData>[
        ChartSampleData(
            x: 'Vehicle',
            y: 62.70,
            text: '100%',
            pointColor: const Color.fromRGBO(69, 186, 161, 1.0)),
        ChartSampleData(
            x: 'Education',
            y: 29.20,
            text: '100%',
            pointColor: const Color.fromRGBO(230, 135, 111, 1.0)),
        ChartSampleData(
            x: 'Home',
            y: 85.20,
            text: '100%',
            pointColor: const Color.fromRGBO(145, 132, 202, 1.0)),
        ChartSampleData(
            x: 'Personal',
            y: 45.70,
            text: '100%',
            pointColor: const Color.fromRGBO(235, 96, 143, 1.0))
      ],
      cornerStyle: CornerStyle.bothCurve,
      xValueMapper: (ChartSampleData data, _) => data.x as String,
      yValueMapper: (ChartSampleData data, _) => data.y,
      pointRadiusMapper: (ChartSampleData data, _) => data.text,

      /// Color mapper for each bar in radial bar series,
      /// which is get from datasource.
      pointColorMapper: (ChartSampleData data, _) => data.pointColor,
      legendIconType: LegendIconType.circle,
    ),
  ];
}

class ChartSampleData {
  ChartSampleData({this.x, required this.y, this.text, this.pointColor});
  final dynamic x;
  final num y;
  final String? text;
  final Color? pointColor;
}

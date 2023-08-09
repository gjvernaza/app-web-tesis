import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:async';

class Chart extends StatefulWidget {
  const Chart({
    super.key,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  double countX = 0;
  double countX2 = 0;
  double _temperatura = 0;
  double _humedad = 0;

  List<DataPoint> data = [DataPoint(x: 0, y: 0)];
  List<DataPoint> data2 = [DataPoint(x: 0, y: 0)];

  final _database = FirebaseDatabase.instance.ref();
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readData();
    // Create a timer that will update the data every second.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Add a new data point to the list.
      data.add(
        DataPoint(
          x: countX++, //data.length.toDouble(),
          y: _temperatura,
        ),
      );
      data2.add(
        DataPoint(
          x: countX2++, //data.length.toDouble(),
          y: _humedad,
        ),
      );

      // Rebuild the widget so that the chart is updated.
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Cancel the timer.
    _timer.cancel();
    super.dispose();
  }

  _readData() {
    _database.child('user1/temperatura').onValue.listen((event) {
      final dataTemp = event.snapshot.value.toString();
      setState(() {
        _temperatura = double.parse(dataTemp);
      });
    });
    _database.child('user1/humedad').onValue.listen((event) {
      final dataHume = event.snapshot.value.toString();
      setState(() {
        _humedad = double.parse(dataHume);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficas'),
      ),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Temperatura - Humedad'),
        // Enable legend
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.top,
        ),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<DataPoint, double>>[
          LineSeries<DataPoint, double>(
            dataSource: data,
            xValueMapper: (DataPoint data, _) => data.x,
            yValueMapper: (DataPoint data, _) => data.y,
          ),
          LineSeries<DataPoint, double>(
            dataSource: data2,
            xValueMapper: (DataPoint data2, _) => data2.x,
            yValueMapper: (DataPoint data2, _) => data2.y,
          ),
        ],
      ),
    );
  }
}

class DataPoint {
  final double x;
  final double y;
  DataPoint({
    required this.x,
    required this.y,
  });
}

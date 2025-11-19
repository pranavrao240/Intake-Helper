import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';

class ProgressChart extends HookConsumerWidget {
  final Map<String, double> dataMap;

  const ProgressChart({required this.dataMap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PieChart(
      dataMap: dataMap,
      chartRadius: MediaQuery.of(context).size.width / 2.5,
      chartType: ChartType.ring,
      colorList: [Colors.redAccent, Colors.amber, Colors.lightBlueAccent],
      legendOptions: const LegendOptions(
        legendPosition: LegendPosition.bottom,
        legendTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}

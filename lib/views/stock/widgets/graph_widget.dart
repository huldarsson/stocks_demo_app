import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stocks_demo_app/models/data_point_model.dart';
import 'package:stocks_demo_app/models/graph_model.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    required this.graph,
    super.key,
  });

  final GraphModel graph;

  // This will be used to draw the orange line

  @override
  Widget build(BuildContext context) {
    DataPointModel firstPoint = graph.dataPoints.first;
    DataPointModel lastPoint = graph.dataPoints.last;

    double change = lastPoint.close - firstPoint.close;
    Color color = change < 0 ? Colors.red[400]! : Colors.green[400]!;
    List<FlSpot> spots = graph.dataPoints
        .asMap()
        .map((i, e) => MapEntry(
              i,
              FlSpot(
                i.toDouble(),
                e.close,
              ),
            ))
        .values
        .toList();

    return SizedBox(
      height: 400,
      width: 400,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              dotData: FlDotData(show: false),
              spots: spots,
              isCurved: true,
              barWidth: 2,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}

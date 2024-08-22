// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// import 'package:fl_chart_app/util/extensions/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:flutter_test_application_1/Utils/CardPage.dart';
import 'package:google_fonts/google_fonts.dart';

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'TOA';
        break;
      case 1:
        text = 'FP';
        break;
      case 2:
        text = 'CAL';
        break;
      case 3:
        text = 'DLD';
        break;
      case 4:
        text = 'COAL';
        break;
      case 5:
        text = 'PY';
        break;
      case 6:
        text = 'JS';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.blue,
          Colors.cyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                toY: 8,
                gradient: _barsGradient,
                width: 30,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20,
                  color: Colors.grey[300],
                )),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                toY: 10,
                gradient: _barsGradient,
                width: 30,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20,
                  color: Colors.grey[300],
                )),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                toY: 14,
                gradient: _barsGradient,
                width: 30,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20,
                  color: Colors.grey[300],
                )),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                toY: 15,
                gradient: _barsGradient,
                width: 30,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20,
                  color: Colors.grey[300],
                )),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                toY: 13,
                gradient: _barsGradient,
                width: 30,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20,
                  color: Colors.grey[300],
                )),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
                toY: 10,
                gradient: _barsGradient,
                width: 30,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20,
                  color: Colors.grey[300],
                )),
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
                toY: 16,
                gradient: _barsGradient,
                width: 30,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 20,
                  color: Colors.grey[300],
                )),
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return CardPage(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
          top: 70.0,
          left: 10,
        ),
        child: Text(
          "Attendance",
          style: GoogleFonts.montserrat().copyWith(
            fontSize: 30,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child:
            montserratText(text: "Currently enrolled subjects of Semester 2"),
      ),
      Stack(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: const Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                child: _BarChart(),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top:15),
        child: montserratText(
            text:
                "*Incase of any issues regarding attendance, please visit your concerned faculty.",
            size: 12),
      ),
      SizedBox(height: 60,)
    ]);
  }
}

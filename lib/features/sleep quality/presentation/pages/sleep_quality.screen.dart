//t2 Core Packages Imports
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as chart;

import '../../../../Data/Model/Sleep Quality/sleep_quality.dart';
import '../../../../presentation/widgets/card_container.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class SleepQualityScreen extends StatefulWidget {
  //SECTION - Widget Arguments

  //!SECTION
  //
  const SleepQualityScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<SleepQualityScreen> createState() => _SleepQualityScreenState();
}

class _SleepQualityScreenState extends State<SleepQualityScreen> {
  //
  //SECTION - State Variables

  //t2 --Controllers

  //t2 --Controllers
  //
  //t2 --State
  List<SleepQuality> monthlySleepQuality = [];

  //t2 --State
  //
  //t2 --Constants
  //t2 --Constants
  //!SECTION

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --Controllers & Listeners
    monthlySleepQuality = getNextSixMonthSleepQuality();
    //t2 --Controllers & Listeners
    //
    //t2 --State
    //t2 --State
    //
    //t2 --Late & Async Initializers
    //t2 --Late & Async Initializers
    //!SECTION
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --State
    //t2 --State
    //!SECTION
  }

  //SECTION - Stateless functions
  //!SECTION
  List<SleepQuality> getNextSixMonthSleepQuality() {
    DateTime now = DateTime.now();
    List<SleepQuality> sleepQualityList = [];
    Random random = Random();

    for (int i = 0; i < 6; i++) {
      DateTime nextMonth = DateTime(now.year, now.month + i, 1);

      String monthAcronym = DateFormat('MMM').format(nextMonth);

      int sleepQualityValue = 30 + random.nextInt(71);

      SleepQuality sleepQuality =
          SleepQuality(monthAcronym: monthAcronym, score: sleepQualityValue);

      sleepQualityList.add(sleepQuality);
    }

    return sleepQualityList;
  }

  //SECTION - Action Callbacks
  //!SECTION

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //t2 -Values
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION
    //SECTION - Build Return
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep quality'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 16.0),
              const Text(
                'Next 6 Months',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16.0),
              CardContainer(
                title: 'Sleep quality',
                measuredValue: "${monthlySleepQuality.first.score}",
                measurementUnit: '/100',
                icon: Icons.hotel,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    // placeholder for graph
                    chart.SfCartesianChart(
                      title: const chart.ChartTitle(
                        text: "Average over that next 6 months",
                        textStyle: TextStyle(
                          color: Color(0xFF1D1A23),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.50,
                        ),
                      ),
                      enableAxisAnimation: true,
                      tooltipBehavior: chart.TooltipBehavior(
                          color: Colors.black, enable: true),
                      primaryXAxis: chart.CategoryAxis(
                        majorGridLines: const chart.MajorGridLines(width: 0),
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.50,
                        ),
                      ),
                      primaryYAxis: chart.NumericAxis(
                        majorGridLines: const chart.MajorGridLines(width: 1.5),
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.50,
                        ),
                        interval: 3,
                      ),
                      series: <chart.CartesianSeries>[
                        chart.SplineSeries<SleepQuality, String>(
                          dataSource: monthlySleepQuality,
                          xValueMapper: (SleepQuality monthlySleepQuality, _) =>
                              monthlySleepQuality.monthAcronym,
                          yValueMapper: (SleepQuality monthlySleepQuality, _) =>
                              monthlySleepQuality.score,
                          width: 4,
                          enableTooltip: true,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    //!SECTION
    super.dispose();
  }
}

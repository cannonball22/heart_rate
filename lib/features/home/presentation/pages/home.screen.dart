//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:heart_rate/features/profile/presentation/pages/profile.screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as chart;

import '../../../../Data/Model/Heart Rate/heart_rate.model.dart';
import '../../../../presentation/widgets/card_container.dart';
import '../../../sleep quality/presentation/pages/sleep_quality.screen.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class HomeScreen extends StatefulWidget {
  //SECTION - Widget Arguments

  //!SECTION
  //
  const HomeScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  //SECTION - State Variables

  //t2 --Controllers

  //t2 --Controllers
  //
  //t2 --State
  List<HeartRate> weeklyHeartRates = [
    HeartRate(dayAcronym: 'SUN', value: 72),
    HeartRate(dayAcronym: 'MON', value: 75),
    HeartRate(dayAcronym: 'TUE', value: 70),
    HeartRate(dayAcronym: 'WED', value: 73),
    HeartRate(dayAcronym: 'THU', value: 76),
    HeartRate(dayAcronym: 'FRI', value: 74),
    HeartRate(dayAcronym: 'SAT', value: 71),
  ];

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
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_2_outlined,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 16.0),
              Text(
                'Today',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16.0),
              CardContainer(
                title: 'Heart rate',
                measuredValue: '76',
                measurementUnit: 'BPM',
                imagePath: "assets/icons/heart-rate-icon.png",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // const SizedBox(
                    //   height: 24,
                    // ),
                    chart.SfCartesianChart(
                      title: chart.ChartTitle(
                        text: "Average over that past 7 days",
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
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
                        chart.SplineSeries<HeartRate, String>(
                          dataSource: weeklyHeartRates,
                          xValueMapper: (HeartRate weeklyHeartRates, _) =>
                              weeklyHeartRates.dayAcronym,
                          yValueMapper: (HeartRate weeklyHeartRates, _) =>
                              weeklyHeartRates.value,
                          width: 4,
                          enableTooltip: true,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              CardContainer(
                title: 'Sleep quality',
                measuredValue: '89',
                measurementUnit: '/100',
                subtitle: "Future data",
                description:
                    "Based on your previous sleep quality scores we will predict how your sleep quality will be in the next couple of months.",
                actionButton: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SleepQualityScreen()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.insights,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'View now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10,
                        ),
                      )
                    ],
                  ),
                ),
                icon: Icons.hotel,
              ),
              const SizedBox(height: 16.0),
              const CardContainer(
                title: 'oxygen saturation (SpO2)',
                measuredValue: '96',
                measurementUnit: '%',
                imagePath: "assets/icons/o2.png",
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

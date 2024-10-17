//t2 Core Packages Imports
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:heart_rate/features/profile/presentation/pages/profile.screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as chart;

import '../../../../Data/Model/App User/app_user.model.dart';
import '../../../../Data/Model/Heart Rate/heart_rate.model.dart';
import '../../../../Data/Repositories/user.repo.dart';
import '../../../../core/Services/API/api_service.dart';
import '../../../../core/Services/Notification/notification.service.dart';
import '../../../../presentation/widgets/card_container.dart';
import '../../../authentication/domain/repositories/AuthService.dart';
import '../../../bluetooth devices/presentation/BluetoothDeviceScreen.dart';
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
  List<HeartRate> heartRateData = [
    HeartRate(time: 0, value: 72),
    HeartRate(time: 1, value: 75),
    HeartRate(time: 2, value: 70),
    HeartRate(time: 3, value: 73),
    HeartRate(time: 4, value: 76),
    HeartRate(time: 5, value: 74),
    HeartRate(time: 6, value: 71),
  ];
  AppUser? appUser;

  BluetoothDevice? _device;
  BluetoothCharacteristic? _characteristic;
  BluetoothDevice? connectedDevice;
  final String characteristicUuid = "0000fff1-0000-1000-8000-00805f9b34fb";
  final String serviceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  String? predictedSleepQuality;
  int bloodOxygen = 0;
  int heartBeat = 0;
  final StreamController<String> _dataStreamController =
      StreamController<String>.broadcast();

  Stream<String> get dataStream => _dataStreamController.stream;

  StreamSubscription<OnCharacteristicReceivedEvent>? subscription;

  Stream<String> startListening() {
    FlutterBluePlus.events.onCharacteristicReceived.listen((value) {
      String data = utf8.decode(value.value);
      _dataStreamController.add(data);
    });
    return dataStream;
  }

  void stopListening() {
    subscription?.cancel();
    _dataStreamController.close();
  }

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
    AppUserRepo().readSingle(AuthService().getCurrentUserId()).then((value) {
      setState(() {
        appUser = value;
      });
    });
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

  Future<BluetoothDevice?> isConnected() async {
    List<BluetoothDevice> bluetoothDevicesList =
        FlutterBluePlus.connectedDevices;
    for (BluetoothDevice bluetoothDevice in bluetoothDevicesList) {
      if (bluetoothDevice.platformName == "ESP32_BLE") {
        return bluetoothDevice;
      }
    }
    return null;
  }

  Future<String> _sendPostRequest(int heartBeat) async {
    ApiHandler apiHandler = ApiHandler(
      baseUrl: "https://accurate-viper-harmless.ngrok-free.app",
    );

    try {
      if (appUser != null) {
        var response = await apiHandler.postRequest("/predict", body: {
          "occupation": appUser?.occupation,
          "age": appUser?.age,
          "sleep_duration": appUser?.sleepDuration,
          "heart_rate": heartBeat,
          "physical_activity": appUser?.physicalActivity,
          "stress_level": appUser?.stressLevel,
          "athlete": appUser?.isAthlete,
          "height": appUser?.height,
          "weight": appUser?.weight,
        });
        return response["predicted_sleep_quality"];
      }
      return "Unknown";
    } catch (e) {
      print("Error while making post request: $e");
      return "Error"; // Return an error message
    }
  }

  Future<void> _navigateAndConnect(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BluetoothDeviceScreen()),
    );

    _device = await isConnected();
    if (_device != null) {
      connectToDevice(_device!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Connected to ESP32_BLE'),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {});
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    _device = device;

    // Discover services
    List<BluetoothService> services = await _device!.discoverServices();

    for (BluetoothService service in services) {
      if (service.uuid.toString() == serviceUuid) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.uuid.toString() == "fff1") {
            _characteristic = characteristic;

            // Set up notifications
            await _characteristic!.setNotifyValue(true);
            _characteristic!.lastValueStream.listen((value) {
              // Handle the incoming data
              String data = utf8.decode(value);
              _dataStreamController.add(data);
            });

            break;
          }
        }
      }
    }
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
      body: FutureBuilder(
          future: isConnected(),
          builder: (BuildContext context, AsyncSnapshot isConnectedSnapshot) {
            if (isConnectedSnapshot.connectionState == ConnectionState.done) {
              if (isConnectedSnapshot.hasError) {
                return const Center(
                  child: Text(
                    "Error has Occurred!",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              if (isConnectedSnapshot.data == null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning_amber,
                        color: Color(0xffDC6803),
                        size: 40,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFAFAFAF),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Connect to device to show the sleep quality & heart rate information.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF475466),
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _navigateAndConnect(context);
                          },
                          child: const Text("Connect"),
                        ),
                      )
                    ],
                  ),
                );
              }
            }
            return StreamBuilder(
                stream: startListening(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  List<String> receivedValue = [];
                  if (snapshot.data != null) {
                    receivedValue = snapshot.data!.split(":");
                    if (receivedValue[0] == "Oximeter Value") {
                      bloodOxygen =
                          int.tryParse(receivedValue[1].split(",")[0]) ?? 0;
                      // send notification
                      if(bloodOxygen < 92){
                        NotificationService.showBasic(
                            "oxygen level", "oxygen level is low");
                      }

                      // title oxygen level
                      // oxygen level is low
                      heartBeat =
                          int.tryParse(receivedValue[1].split(",")[1]) ?? 0;
                      heartRateData.add(
                        HeartRate(
                          value: heartBeat.toDouble(),
                          time: heartRateData.length + 1,
                        ),
                      );
                      _sendPostRequest(heartBeat).then((result) {
                        // setState(() {
                        if (result == "Good" || result == "Bad") {
                          predictedSleepQuality = result;
                        }
                        // });
                      });
                    }
                  }
                  if (heartRateData.isNotEmpty) {
                    print(heartRateData.last.value);
                  } else {
                    heartRateData.add(HeartRate(value: 0, time: 0));
                    print(
                        'No heart rate data available, added dummy data: ${heartRateData.last.value}');
                  }

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 16.0),
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
                            measuredValue: '$heartBeat',
                            measurementUnit: 'BPM',
                            imagePath: "assets/icons/heart-rate-icon.png",
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                chart.SfCartesianChart(
                                  title: chart.ChartTitle(
                                    text: "Average",
                                    textStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  enableAxisAnimation: true,
                                  tooltipBehavior: chart.TooltipBehavior(
                                      color: Colors.black, enable: true),
                                  primaryXAxis: chart.CategoryAxis(
                                    majorGridLines:
                                        const chart.MajorGridLines(width: 0),
                                    labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  primaryYAxis: chart.NumericAxis(
                                    majorGridLines:
                                        const chart.MajorGridLines(width: 1.5),
                                    labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.50,
                                    ),
                                    interval: 3,
                                  ),
                                  series: <chart.CartesianSeries>[
                                    chart.SplineSeries<HeartRate, double>(
                                      dataSource: heartRateData,
                                      xValueMapper:
                                          (HeartRate weeklyHeartRates, _) =>
                                              weeklyHeartRates.time,
                                      yValueMapper:
                                          (HeartRate weeklyHeartRates, _) =>
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
                            measuredValue: predictedSleepQuality ?? "",
                            textStyle: TextStyle(
                              color: predictedSleepQuality == "Bad"
                                  ? Colors.red
                                  : Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                            subtitle: "Future data",
                            description:
                                "Based on your previous sleep quality scores we will predict how your sleep quality will be in the next couple of months.",
                            actionButton: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary),
                              onPressed: () async {
                                // var res = await _sendPostRequest(70);
                                // print("API response: $res");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const SleepQualityScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.insights,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'View now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
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
                          CardContainer(
                            title: 'oxygen saturation (SpO2)',
                            measuredValue: '$bloodOxygen',
                            measurementUnit: '%',
                            imagePath: "assets/icons/o2.png",
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
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

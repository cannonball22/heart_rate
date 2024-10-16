import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothDeviceScreen extends StatefulWidget {
  const BluetoothDeviceScreen({super.key});

  @override
  BluetoothDeviceScreenState createState() => BluetoothDeviceScreenState();
}

class BluetoothDeviceScreenState extends State<BluetoothDeviceScreen> {
  List<ScanResult> scanResults = [];
  BluetoothDevice? selectedDevice;
  StreamSubscription<List<ScanResult>>? scanSubscription;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    startScan();
  }

  @override
  void dispose() {
    // Stop scanning and cancel subscription when widget is disposed
    if (isScanning) {
      FlutterBluePlus.stopScan();
    }
    scanSubscription?.cancel();
    super.dispose();
  }

  void startScan() {
    setState(() {
      isScanning = true;
    });

    scanSubscription = FlutterBluePlus.scanResults.listen((results) {
      if (mounted) {
        setState(() {
          scanResults = results;
        });
      }
    });

    FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 10), androidUsesFineLocation: true);

    // Stop scanning after timeout
    Future.delayed(const Duration(seconds: 10), () {
      if (isScanning) {
        FlutterBluePlus.stopScan();
        // setState(() {
          isScanning = false;
        // });
      }
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    await device.connect();
    setState(() {
      selectedDevice = device;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Connected to ${device.platformName}'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0F1A),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Available Bluetooth Devices',
          // style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0F0F1A),
        centerTitle: true,
      ),
      body: scanResults.isEmpty
          ? Center(
              child: isScanning
                  ? const CircularProgressIndicator()
                  : const Text(
                      'No devices found',
                      style: TextStyle(color: Colors.white),
                    ))
          : ListView.builder(
              itemCount: scanResults.length,
              itemBuilder: (context, index) {
                final device = scanResults[index].device;
                return ListTile(
                  title: Text(
                    device.platformName.isNotEmpty
                        ? device.platformName
                        : 'Unknown Device',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    device.remoteId.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: selectedDevice?.remoteId == device.remoteId
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : const Icon(Icons.bluetooth, color: Colors.white),
                  onTap: () {
                    connectToDevice(device);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        tooltip: 'Rescan Devices',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
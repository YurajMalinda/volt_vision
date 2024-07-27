import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class BleController extends GetxController {
  FlutterBlue ble = FlutterBlue.instance;
  var scanning = false.obs; // Observable flag for scanning status
  var scanResults = <ScanResult>[].obs; // Observable list for scan results

  @override
  void onInit() {
    super.onInit();
    ble.scanResults.listen((results) {
      scanResults.clear(); // Clear scan results to avoid duplicates
      for (var result in results) {
        if (!scanResults.any((r) => r.device.id == result.device.id)) {
          scanResults.add(result);
        }
      }
      logScanResults();
    });
  }

  void logScanResults() {
    print("Scan Results:");
    for (var result in scanResults) {
      print(
          'Device ID: ${result.device.id.id}, Device Name: ${result.device.name.isEmpty ? "Unknown Device" : result.device.name}, RSSI: ${result.rssi}');
      print('############### ' + result.device.name);
    }
  }

  Future<void> scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted &&
        await Permission.locationWhenInUse.request().isGranted) {
      try {
        scanning.value = true; // Start scanning
        scanResults.clear(); // Clear previous scan results

        await ble.startScan(timeout: const Duration(seconds: 15));
        scanning.value = false; // Stop scanning after timeout
        if (scanResults.isEmpty) {
          print("No devices found");
        }
      } catch (e) {
        print("Error while scanning: $e");
        scanning.value = false; // Stop scanning on error
      }
    } else {
      print("Permissions not granted");
    }
  }

  Future<void> stopScan() async {
    await ble.stopScan();
    scanning.value = false; // Stop scanning
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(
          timeout:
              const Duration(seconds: 30)); // Increase timeout to 30 seconds
      device.state.listen((state) {
        if (state == BluetoothDeviceState.connecting) {
          print("Device connecting to: ${device.name}");
        } else if (state == BluetoothDeviceState.connected) {
          print("Device connected: ${device.name}");
        } else {
          print("Device Disconnected");
        }
      });
    } on TimeoutException catch (_) {
      print("Failed to connect in time to ${device.name}");
    } catch (e) {
      print("Error connecting to device: $e");
    }
  }
}
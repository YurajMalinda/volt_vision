import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async'; // Add this import for TimeoutException

class BleController extends GetxController {
  FlutterBlue ble = FlutterBlue.instance;
  var scanning = false.obs; // Observable flag for scanning status

  Future<void> scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted &&
        await Permission.locationWhenInUse.request().isGranted) {
      scanning.value = true; // Start scanning
      ble.startScan(timeout: const Duration(seconds: 15)).then((_) {
        scanning.value = false; // Stop scanning
      }).catchError((e) {
        scanning.value = false; // Stop scanning on error
      });
    }
  }

  Future<void> stopScan() async {
    ble.stopScan();
    scanning.value = false; // Stop scanning
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(timeout: const Duration(seconds: 30)); // Increase timeout to 30 seconds
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

  Stream<List<ScanResult>> get scanResults => ble.scanResults;
}

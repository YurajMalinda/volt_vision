import 'package:volt_vision/screens/ble_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BleController controller = Get.put(BleController());

    return Scaffold(
      appBar: AppBar(title: const Text("BLE SCANNER")),
      backgroundColor: Color(0xFF232323),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.scanning.value
                ? CircularProgressIndicator() // Show progress indicator while scanning
                : const SizedBox.shrink()), // Hide when not scanning
            Expanded(
              child: Obx(() {
                final scanResults = controller.scanResults;
                if (scanResults.isNotEmpty) {
                  return ListView.builder(
                    itemCount: scanResults.length,
                    itemBuilder: (context, index) {
                      final data = scanResults[index];
                      // Debug print
                      print(
                          'Device ID: ${data.device.id.id}, Device Name: ${data.device.name}, RSSI: ${data.rssi}');

                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(data.device.name.isEmpty
                              ? 'Unknown Device'
                              : data.device.name),
                          subtitle: Text(data.device.id.id),
                          trailing: Text(data.rssi.toString()),
                          onTap: () => controller.connectToDevice(data.device),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No Device Found"));
                }
              }),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await controller.scanDevices();
              },
              child: const Text("SCAN"),
            ),
          ],
        ),
      ),
    );
  }
}

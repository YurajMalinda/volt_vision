import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BluetoothScanner(),
    );
  }
}

class BluetoothScanner extends StatefulWidget {
  const BluetoothScanner({super.key});

  @override
  BluetoothScannerState createState() => BluetoothScannerState();
}

class BluetoothScannerState extends State<BluetoothScanner>
    with SingleTickerProviderStateMixin {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devicesList = [];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    startScan();
  }

  void startScan() {
    flutterBlue.startScan(timeout: const Duration(seconds: 4));
    flutterBlue.scanResults.listen((scanResults) {
      setState(() {
        devicesList.clear(); // Clear the list before adding new devices
        for (ScanResult result in scanResults) {
          if (!devicesList.contains(result.device)) {
            devicesList.add(result.device);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  const Text(
                    'Select device',
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                  Image.asset(
                    'assets/images/nearbyDevices.png', // Adjust the path to your asset
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: ScannerPainter(
                      angle: _controller.value * 2 * pi,
                      devices: devicesList,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Scanning for devices...',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: devicesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      devicesList[index].name.isEmpty
                          ? 'Unknown Device'
                          : devicesList[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      devicesList[index].id.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerPainter extends CustomPainter {
  final double angle;
  final List<BluetoothDevice> devices;

  ScannerPainter({required this.angle, required this.devices});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final bluePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    final rect = Rect.fromCircle(
        center: size.center(Offset.zero), radius: size.width / 2);
    canvas.drawArc(rect, angle, pi / 4, true, bluePaint);

    for (BluetoothDevice device in devices) {
      final double deviceAngle = (device.id.hashCode % 360) * (pi / 180);
      final double radius = size.width / 2 * 0.8;
      final double dx = size.width / 2 + radius * cos(deviceAngle);
      final double dy = size.height / 2 + radius * sin(deviceAngle);
      canvas.drawCircle(Offset(dx, dy), 5, redPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

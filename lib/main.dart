import 'package:flutter/material.dart';
import 'package:volt_vision/screens/StartedPage.dart';
import 'package:volt_vision/screens/add_device.dart'; // Ensure this path is correct
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Volt Vision',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF232323),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF232323), // Dark grey color
        ),
        child: const StartedPage(),
      ),
    );
  }
}

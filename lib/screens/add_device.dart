import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volt_vision/screens/select_device.dart';

class AddDevice extends StatelessWidget {
  const AddDevice({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle commonStyle = GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Colors.white, // Adjust as needed
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Text(
            "Add your devices",
            style: commonStyle.copyWith(
              fontSize: 34,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 50,
          ),
          child: Text(
            "Select the method of adding the device.",
            style: commonStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gradient container for "Nearby Devices"
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  width: 355,
                  height: 110,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(43, 45, 45, 45),
                        Color.fromARGB(255, 55, 55, 55)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Image.asset(
                          'assets/images/nearbyDevices.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const Text(
                        "Search Devices",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Find nearby devices that you can connect to.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                width: 355,
                height: 110,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(43, 45, 45, 45),
                      Color.fromARGB(255, 55, 55, 55)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/images/enterManually.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const Text(
                      "Enter manually",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Find nearby devices that you can connect to.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

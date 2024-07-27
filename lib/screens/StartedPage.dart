import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volt_vision/screens/PermissionPage.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: const Color(0xFF232323),
          child: Column(
            children: [
              Image.asset(
                'assets/startpage/startpage.png', // Your image asset path
                width: screenWidth,
                height: screenHeight * 0.55,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/startpage/volvisionlogo.png',
                        height: screenHeight * 0.09,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        "VOLT VISION",
                        style: GoogleFonts.judson(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.12,
                            color: const Color(0xFFD4D4D4),
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "we help you to control your home appliance",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.037,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "digitally from anywhere in the world with our app.",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.037,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(), // Pushes the buttons to the bottom
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: SizedBox(
                                height: screenHeight * 0.08,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (_) {
                                        return const PermissionPage();
                                      },
                                    ));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xFFADCEEC),
                                    ), // Button color
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            78.0), // Button radius
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Get Started",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenWidth * 0.05,
                                        color: const Color(
                                            0xFF404040), // Button font color
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: screenHeight * 0.08,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xFF353333),
                                    ), // Button color
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            78.0), // Button radius
                                      ),
                                    ),
                                    shadowColor: WidgetStateProperty.all<Color>(
                                      const Color(0xFF353333),
                                    ),
                                    elevation:
                                        WidgetStateProperty.all<double>(4.0),
                                  ),
                                  child: SizedBox(
                                    height: screenHeight * 0.05,
                                    width: screenHeight * 0.05,
                                    child: Image.asset(
                                      'assets/startpage/googleicon.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: screenHeight * 0.08,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xFF353333),
                                    ), // Button color
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            78.0), // Button radius
                                      ),
                                    ),
                                    shadowColor: WidgetStateProperty.all<Color>(
                                      const Color(0xFF353333),
                                    ),
                                    elevation:
                                        WidgetStateProperty.all<double>(4.0),
                                  ),
                                  child: SizedBox(
                                    height: screenHeight * 0.05,
                                    width: screenHeight * 0.05,
                                    child: Image.asset(
                                      'assets/startpage/fb.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddManuallyPage extends StatefulWidget {
  const AddManuallyPage({super.key});

  @override
  State<AddManuallyPage> createState() => _AddManuallyPageState();
}

class _AddManuallyPageState extends State<AddManuallyPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: const Color(0xFF232323),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.05),
                    width: screenWidth * 0.90,
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Back button tapped");
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Image.asset(
                                'assets/devicemanuallyaddpage/backarrowbtn.png'),
                          ),
                        ),
                        Text(
                          "Add device",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Search button tapped");
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Image.asset(
                                'assets/devicemanuallyaddpage/devicesearchbtn.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.10),
                    color: Colors.red,
                    width: screenWidth * 0.90,
                    height: screenHeight * 0.75,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

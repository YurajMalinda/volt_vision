import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volt_vision/screens/HomePage.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF232323),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: screenHeight * 0.53,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                      ),
                      child: Text(
                        "To provide you with better services, we request the following permissions:",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/permissionpage/permissionmainpictureback.png',
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              'assets/permissionpage/permissionpagemainpicture.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "The following functions can be enabled or disabled in the app settings.",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPermissionCard(
                        context,
                        "Service Maintenance & Improvement Activity",
                        "Allow us to collect data related to product usage. Basic functionality will still be available if permissions are disabled but the experience optimization policy based on data preferences will be ineffective.",
                      ),
                      _buildPermissionCard(
                        context,
                        "Personalized Recommendations",
                        "Allow us to recommend content to you, including experience optimization, scene linkage, and best usage advice for devices. If you disable this function, we will no longer send you potentially interesting content.",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const Homepage(),
                              ));
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                const Color(0xFF505050),
                              ), // Button color
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Button radius
                                ),
                              ),
                            ),
                            child: Text(
                              "Go to App",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  color: Color(0xFFD4D4D4), // Button font color
                                ),
                              ),
                            ),
                          ),
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

  Widget _buildPermissionCard(
      BuildContext context, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/permissionpage/checkmark.png',
              height: 30,
              width: 30,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

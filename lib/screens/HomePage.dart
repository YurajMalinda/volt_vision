
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSwitched = false;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(screenWidth, screenHeight),
              _buildDateContainer(screenHeight, screenWidth),
              _buildUsageHistory(screenHeight, screenWidth),
              _buildRooms(screenHeight, screenWidth),
              _buildDevices(screenHeight, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
        bottom: screenHeight * 0.03,
      ),
      // padding: EdgeInsets.only(right: screenWidth * 0.02),
      width: double.infinity,
      // height: screenHeight * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sweet Home,",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Theekshana de silva",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: screenWidth * 0.15,
                height: screenHeight * 0.07,
                child: FloatingActionButton(
                  onPressed: () {
                    // Define your action here
                  },
                  backgroundColor: const Color(0xFF353333),
                  shape: const CircleBorder(),
                  child: Image.asset('assets/homepage/setting.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDateContainer(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
      ),
      padding: EdgeInsets.all(screenWidth * 0.05),
      width: double.infinity,
      height: screenHeight * 0.13,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF343434), Color(0xFF232323)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0x5E000000),
          width: 0.7,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sunday,",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "10 November",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "18",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.1,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Image.asset('assets/homepage/rain.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUsageHistory(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03, horizontal: screenWidth * 0.05),
      width: double.infinity,
      height: screenHeight * 0.13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Usage History",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.12,
                height: screenHeight * 0.03,
                child: InkWell(
                  onTap: () {
                    print('Button clicked');
                    // Define your action here
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF353333),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Image.asset('assets/homepage/doubledot.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
          _buildUsageDetails(screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _buildUsageDetails(double screenHeight, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildUsageItem("assets/homepage/thunder.png", "45.56", "kwh",
              "Usage today", screenWidth, screenHeight),
          _buildUsageItem("assets/homepage/money.png", "48", "dolar",
              "Usage today", screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildUsageItem(String assetPath, String value, String unit,
      String description, double screenWidth, double screenHeight) {
    return Flexible(
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.13,
            height: screenHeight * 0.06,
            child: FloatingActionButton(
              onPressed: () {
                // Define your action here
              },
              backgroundColor: const Color(0xFF353333),
              shape: const CircleBorder(),
              child: Image.asset(assetPath),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    value,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    unit,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                description,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRooms(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
      width: double.infinity,
      height: screenHeight * 0.13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rooms",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.12,
                height: screenHeight * 0.03,
                child: InkWell(
                  onTap: () {
                    print('Button clicked');
                    // Define your action here
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF353333),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Image.asset('assets/homepage/doubledot.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
          _buildRoomDetails(screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _buildRoomDetails(double screenHeight, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.87,
      height: screenHeight * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRoomItem("assets/homepage/room.png", "Room", "6 devices",
              screenWidth, screenHeight),
          _buildRoomItem("assets/homepage/kitchen.png", "Kitchen", "3 devices",
              screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildRoomItem(String assetPath, String roomName, String deviceCount,
      double screenWidth, double screenHeight) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.12,
              height: screenHeight * 0.06,
              decoration: BoxDecoration(
                color: const Color(0xFF404040),
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(assetPath),
            ),
            SizedBox(width: screenWidth * 0.04),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  deviceCount,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.035,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDevices(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03, horizontal: screenWidth * 0.05),
      width: double.infinity,
      height: screenHeight * 0.27,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Devices",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          _buildDeviceList(screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _buildDeviceList(double screenHeight, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDeviceItem("assets/homepage/air-conditioner.png",
              "Air conditioner", "6", screenWidth, screenHeight),
          _buildDeviceItem("assets/homepage/lights.png", "Lights", "6",
              screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildDeviceItem(String assetPath, String deviceName,
      String deviceCount, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03),
      width: screenWidth * 0.9,
      height: screenHeight * 0.10,
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: screenWidth * 0.12,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: const Color(0xFF624864),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(assetPath),
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    deviceName,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        deviceCount,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.035,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "Devices",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.035,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.blue,
            activeColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

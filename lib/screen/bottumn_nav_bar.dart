import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:blood_donation_app/screen/donation_history_sceen.dart';
import 'package:blood_donation_app/screen/donation_location_search_screen.dart';
import 'package:blood_donation_app/screen/home_scree.dart';
import 'package:blood_donation_app/screen/notification_screen.dart';
import 'package:blood_donation_app/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodDonationHomeScreen extends StatefulWidget {
  final int initialIndex;

  BloodDonationHomeScreen({this.initialIndex = 0});

  @override
  _BloodDonationHomeScreenState createState() => _BloodDonationHomeScreenState();
}

class _BloodDonationHomeScreenState extends State<BloodDonationHomeScreen> {
  late int _bottomNavIndex;

  @override
  void initState() {
    super.initState();
    _bottomNavIndex = widget.initialIndex;
  }

  final iconList = <IconData>[
    Icons.home,
    Icons.location_on,
    Icons.history,
    Icons.person,
  ];

  final List<Widget> _screens = [
    HomeScreen(),
    LocationSearchScreen(),
    DonationHistoryScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Donation Scheduling',
    'Location Search',
    'Donation History',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _titles[_bottomNavIndex],
          style: GoogleFonts.lato(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Get.to(NotificationScreen());
                  // Handle notification icon press
                },
              ),
              Positioned(
                right: 8.0,
                top: 8.0,
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 20.0,
                    maxHeight: 20.0,
                  ),
                  child: Center(
                    child: Text(
                      '3', // Replace with the number of notifications
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: _screens[_bottomNavIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        backgroundColor: Colors.white,
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}

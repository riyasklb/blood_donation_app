import 'package:blood_donation_app/routes/app_route_constants.dart';
import 'package:blood_donation_app/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    final List<String> dummyData = [
      "Blood donation camp at City Hall on 15th August.",
      "Urgent need for O+ blood type in the local hospital.",
      "Register for the blood donation drive this weekend.",
      "Update: Blood donation guidelines have changed.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.lato(
            fontSize: 20.sp, // Scaled font size using ScreenUtil
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.to(NotificationScreen());// Navigate using GetX
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add padding for better UI
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Blood Donation App',
              style: GoogleFonts.montserrat(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20.h), // Add spacing between elements
            Text(
              'Important Updates:',
              style: GoogleFonts.lato(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h), // Add spacing between elements
            Expanded(
              child: ListView.builder(
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        dummyData[index],
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                        ),
                      ),
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

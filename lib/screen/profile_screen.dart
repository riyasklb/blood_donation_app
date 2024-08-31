import 'package:blood_donation_app/screen/bottumn_nav_bar.dart';
import 'package:blood_donation_app/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture with border and shadow
            CircleAvatar(
              radius: 50.w,
              backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with your image path
              backgroundColor: Colors.grey[200],
              child: CircleAvatar(
                radius: 48.w,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage('https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=1024x1024&w=is&k=20&c=iGtRKCTRSvPVl3eOIpzzse5SvQFfImkV0TZuFh-74ps='), // Replace with your image path
              ),
            ),
            SizedBox(height: 16.h),
            // User Name
            Text(
              'John Doe', // Replace with dynamic user name
              style: GoogleFonts.montserrat(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            // User Email
            Text(
              'johndoe@example.com', // Replace with dynamic user email
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16.h),
            // User Phone
            _buildProfileDetail('Phone', '+1 234 567 890'), // Replace with dynamic user phone number
            SizedBox(height: 16.h),
            // User Address
            _buildProfileDetail('Address', '123 Main Street, City, Country'), // Replace with dynamic user address
            SizedBox(height: 16.h),
            // User Date of Birth
            _buildProfileDetail('Date of Birth', 'January 1, 1990'), // Replace with dynamic user date of birth
            SizedBox(height: 32.h),
            // Action Buttons with rounded corners and elevated styles
            ElevatedButton(
              onPressed: () {
                // Handle edit profile action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w), backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.w),
                ), // Edit button color
                elevation: 5,
              ),
              child: Text(
                'Edit Profile',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                Get.off(OtpScreen());
                // Handle log out action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w), backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.w),
                ), // Log out button color
                elevation: 5,
              ),
              child: Text(
                'Log Out',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for profile details
  Widget _buildProfileDetail(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.lato(
              fontSize: 16.sp,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

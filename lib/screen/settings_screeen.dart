import 'package:blood_donation_app/screen/about_screen.dart';
import 'package:blood_donation_app/screen/blood_type_screen.dart';
import 'package:blood_donation_app/screen/bottumn_nav_bar.dart';
import 'package:blood_donation_app/screen/help_screen.dart';
import 'package:blood_donation_app/screen/notification_screen.dart';
import 'package:blood_donation_app/screen/otp_screen.dart';
import 'package:blood_donation_app/screen/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_donation_app/theme/app_color.dart'; // Make sure this import matches your actual path

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _buildSettingsItem('Profile Information', Icons.person, () {
          Get.to(() => BloodDonationHomeScreen(initialIndex: 3));
              // Handle profile information action
            }),
            SizedBox(height: 16.h),
            _buildSettingsItem('Blood Type', Icons.bloodtype, () {
              Get.to(BloodTypeScreen());
              // Handle blood type action
            }),
            SizedBox(height: 16.h),
            _buildSettingsItem('Donation History', Icons.history, () {
              Get.to(() => BloodDonationHomeScreen(initialIndex: 2));
              // Handle donation history action
            }),
            SizedBox(height: 16.h),
            _buildSettingsItem('Notification Preferences', Icons.notifications,
                () {
                  Get.to(NotificationScreen());
              // Handle notification preferences action
            }),
            SizedBox(height: 16.h),
            _buildSettingsItem('Privacy Settings', Icons.lock, () {
              Get.to(PrivacyPolicyScreen());
              // Handle privacy settings action
            }),
            // SizedBox(height: 16.h),
            // _buildSettingsItem('Language Preferences', Icons.language, () {
            //   // Handle language preferences action
            // }),
            // SizedBox(height: 16.h),
            // _buildSettingsItem('Theme', Icons.brightness_6, () {
            //   // Handle theme action
            // }),
            SizedBox(height: 16.h),
            _buildSettingsItem('Help & Support', Icons.help, () {
              // Handle help & support action
              Get.to(HelpAndSupportScreen());
            }),
            SizedBox(height: 16.h),
            _buildSettingsItem('About', Icons.info, () {
              Get.to(AboutScreen());
              // Handle about action
            }),
            SizedBox(height: 16.h),
            _buildSettingsItem('Logout', Icons.logout, () {
              _showLogoutDialog(context);
            }),
            SizedBox(height: 32.h),
            // Center(
            //   child: ElevatedButton.icon(
            //     onPressed: () {
            //       // Handle save settings action
            //    //   Get.back();
            //     },
            //     icon: Icon(Icons.save, color: Colors.white, size: 22.w),
            //     label: Text(
            //       'Save Changes',
            //       style: GoogleFonts.lato(
            //         fontSize: 18.sp,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //       ),
            //     ),
            //     style: ElevatedButton.styleFrom(
            //       padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
            //       backgroundColor: AppColors.primary,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30.w),
            //       ),
            //       elevation: 5,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 22.w),
            SizedBox(width: 16.w),
            Text(
              label,
              style: GoogleFonts.lato(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 18.w),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle logout logic here
                Navigator.of(context).pop(); // Close the dialog
                Get.to(
                    OtpScreen()); // Navigate to login screen or wherever you need
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

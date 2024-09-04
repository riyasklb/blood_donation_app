import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_donation_app/theme/app_color.dart'; // Make sure this import matches your actual path

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
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
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //  _buildHeaderImage(),
                SizedBox(height: 16.h),
                _buildIntroduction(),
                SizedBox(height: 24.h),
                _buildSection('Introduction', 'This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this privacy policy carefully.'),
                SizedBox(height: 24.h),
                _buildSection('Information We Collect', 'We may collect information about you in a variety of ways. The information we may collect includes personal data, usage data, and technical data.'),
                SizedBox(height: 24.h),
                _buildSection('How We Use Your Information', 'We use the information we collect from the app to provide, operate, and maintain our services, improve and personalize your experience, and communicate with you.'),
                SizedBox(height: 24.h),
                _buildSection('How We Share Your Information', 'We do not sell or rent your personal information to third parties. We may share your information with trusted partners who assist us in operating our app.'),
                SizedBox(height: 24.h),
                _buildSection('Security', 'We implement appropriate security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction.'),
                SizedBox(height: 24.h),
                _buildSection('Your Rights', 'You have the right to access, correct, or delete your personal data. You may also have the right to object to or restrict certain processing of your data.'),
                SizedBox(height: 24.h),
                _buildSection('Changes to This Privacy Policy', 'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.'),
                SizedBox(height: 24.h),
                _buildSection('Contact Us', 'If you have any questions about this Privacy Policy, please contact us at support@example.com.'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/privacy_policy_header.png'), // Use an image that suits your app's theme
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.w),
      ),
    );
  }

  Widget _buildIntroduction() {
    return Text(
      'Welcome to our Privacy Policy',
      style: GoogleFonts.montserrat(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              content,
              style: GoogleFonts.lato(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_donation_app/theme/app_color.dart'; // Make sure this import matches your actual path

class HelpAndSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFAQ(),
            SizedBox(height: 32.h),
            _buildContactSupport(),
            SizedBox(height: 32.h),
            _buildResources(),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQ() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions (FAQ)',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            _buildFAQItem('How do I donate blood?', 'Follow the steps provided in the donation section of the app. You can find more details under the "Donation Guide".'),
            SizedBox(height: 16.h),
            _buildFAQItem('How can I change my profile details?', 'Go to "Profile" and select "Edit Profile" to update your details.'),
            SizedBox(height: 16.h),
            _buildFAQItem('How do I contact support?', 'You can contact support through the "Contact Support" section below.'),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: GoogleFonts.lato(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Text(
            answer,
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactSupport() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Support',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'For any support related queries, you can reach out to us via:',
              style: GoogleFonts.lato(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.h),
            _buildContactMethod('Email', 'support@example.com'),
            SizedBox(height: 16.h),
            _buildContactMethod('Phone', '+123 456 7890'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactMethod(String method, String detail) {
    return Row(
      children: [
        Icon(Icons.contact_mail, color: AppColors.primary, size: 24.w),
        SizedBox(width: 16.w),
        Text(
          '$method: $detail',
          style: GoogleFonts.lato(
            fontSize: 14.sp,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildResources() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Additional Resources',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            _buildResourceItem('Donation Guide', 'https://www.example.com/donation-guide'),
            SizedBox(height: 16.h),
            _buildResourceItem('Health Tips', 'https://www.example.com/health-tips'),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceItem(String title, String url) {
    return GestureDetector(
      onTap: () {
        // Handle link opening
        // You can use a package like url_launcher to open URLs
      },
      child: Row(
        children: [
          Icon(Icons.link, color: AppColors.primary, size: 24.w),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 14.sp,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

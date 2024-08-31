import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Donation History',
            style: GoogleFonts.lato(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h), // Responsive spacing
          Expanded(
            child: ListView(
              children: [
                _buildDonationCard('15th August, 2024', 'City Hall Blood Donation Camp', 'O+ Blood'),
                _buildDonationCard('22nd July, 2024', 'Community Blood Drive', 'A- Blood'),
                _buildDonationCard('29th June, 2024', 'Hospital Blood Donation Event', 'B+ Blood'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationCard(String date, String event, String bloodType) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          '$date',
          style: GoogleFonts.lato(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '$event\nBlood Type: $bloodType',
          style: GoogleFonts.lato(fontSize: 16.sp),
        ),
      ),
    );
  }
}

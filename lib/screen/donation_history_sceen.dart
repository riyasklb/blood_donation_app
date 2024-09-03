import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with icon
            Row(
              children: [
                Icon(
                  Icons.history,
                  color: Colors.redAccent,
                  size: 28.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Donation History',
                  style: GoogleFonts.lato(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h), // Responsive spacing

            // List of Donation History Cards
            Expanded(
              child: ListView(
                children: [
                  _buildDonationCard('15th August, 2024', 'City Hall Blood Donation Camp', 'O+ Blood'),
                  _buildDonationCard('22nd July, 2024', 'Community Blood Drive', 'A- Blood'),
                  _buildDonationCard('29th June, 2024', 'Hospital Blood Donation Event', 'B+ Blood'),
                  _buildDonationCard('10th June, 2024', 'Red Cross Blood Donation Camp', 'AB+ Blood'),
                  _buildDonationCard('25th May, 2024', 'Neighborhood Blood Donation', 'O- Blood'),
                  _buildDonationCard('1st May, 2024', 'Charity Blood Donation Event', 'B- Blood'),
                  _buildDonationCard('15th April, 2024', 'Corporate Blood Drive', 'A+ Blood'),
                  _buildDonationCard('5th April, 2024', 'School Blood Donation Event', 'AB- Blood'),
                  _buildDonationCard('20th March, 2024', 'Local Blood Donation Camp', 'O+ Blood'),
                  _buildDonationCard('10th March, 2024', 'Emergency Blood Donation', 'B+ Blood'),
                  _buildDonationCard('28th February, 2024', 'University Blood Donation Event', 'A- Blood'),
                  _buildDonationCard('15th February, 2024', 'Community Center Blood Drive', 'O+ Blood'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationCard(String date, String event, String bloodType) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: CircleAvatar(
          backgroundColor: Colors.redAccent,
          radius: 24.w,
          child: Icon(
            Icons.local_hospital,
            color: Colors.white,
            size: 24.w,
          ),
        ),
        title: Text(
          date,
          style: GoogleFonts.lato(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          '$event\nBlood Type: $bloodType',
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            color: Colors.black54,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.redAccent,
          size: 20.w,
        ),
      ),
    );
  }
}

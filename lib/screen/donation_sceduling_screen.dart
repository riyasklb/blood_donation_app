import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationSchedulingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Donation Schedules',
            style: GoogleFonts.lato(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h), // Responsive spacing
          Expanded(
            child: ListView(
              children: [
                _buildScheduleCard('Blood Donation Camp at City Hall', '15th August, 2024', Colors.red),
                _buildScheduleCard('Community Blood Drive', '22nd August, 2024', Colors.blue),
                _buildScheduleCard('Hospital Blood Donation Event', '29th August, 2024', Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(String title, String date, Color color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          title,
          style: GoogleFonts.lato(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          date,
          style: GoogleFonts.lato(fontSize: 16.sp),
        ),
        tileColor: color.withOpacity(0.1),
      ),
    );
  }
}

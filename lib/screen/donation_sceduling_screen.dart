import 'package:blood_donation_app/screen/schedule_donation_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationSchedulingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Donation Scheduling',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Donation Schedules',
              style: GoogleFonts.lato(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView(
                children: [
                  _buildScheduleCard(
                      'Blood Donation Camp at City Hall', '15th August, 2024', Colors.red, Icons.location_city),
                  _buildScheduleCard('Community Blood Drive', '22nd August, 2024', Colors.blue, Icons.people),
                  _buildScheduleCard(
                      'Hospital Blood Donation Event', '29th August, 2024', Colors.green, Icons.local_hospital),
                ],
              ),
            ),
             SizedBox(height: 20.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the schedule form page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScheduleDonationFormScreen()),
                  );
                },
                child: Text(
                  'Schedule a Donation',
                  style: GoogleFonts.lato(fontSize: 18.sp),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleCard(String title, String date, Color color, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8.0.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 30.w,
          ),
        ),
        contentPadding: EdgeInsets.all(16.0.w),
        title: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          date,
          style: GoogleFonts.lato(fontSize: 16.sp, color: Colors.black54),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}

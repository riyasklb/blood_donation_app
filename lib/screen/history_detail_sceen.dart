import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationDetailScreen extends StatelessWidget {
  final String date;
  final String event;
  final String bloodType;
  final String location;
  final String notes;

  DonationDetailScreen({
    required this.date,
    required this.event,
    required this.bloodType,
    required this.location,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Details', style: GoogleFonts.lato()),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(
              context,
              title: 'Date',
              value: date,
              icon: Icons.calendar_today,
            ),
            SizedBox(height: 12.h),
            _buildDetailCard(
              context,
              title: 'Event',
              value: event,
              icon: Icons.event,
            ),
            SizedBox(height: 12.h),
            _buildDetailCard(
              context,
              title: 'Blood Type',
              value: bloodType,
              icon: Icons.local_hospital,
            ),
            SizedBox(height: 12.h),
            _buildDetailCard(
              context,
              title: 'Location',
              value: location,
              icon: Icons.location_on,
            ),
            SizedBox(height: 20.h),
            _buildNotesSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(BuildContext context, {required String title, required String value, required IconData icon}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        leading: Icon(icon, color: Colors.redAccent, size: 24.w),
        title: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          value,
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildNotesSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Additional Notes',
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              notes.isNotEmpty ? notes : 'No additional notes available.',
              style: GoogleFonts.lato(
                fontSize: 16.sp,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

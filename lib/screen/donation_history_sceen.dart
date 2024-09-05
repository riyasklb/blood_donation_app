import 'package:blood_donation_app/screen/history_detail_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> donations = [
    {'date': '15th August, 2024', 'event': 'City Hall Blood Donation Camp', 'bloodType': 'O+ Blood'},
    {'date': '22nd July, 2024', 'event': 'Community Blood Drive', 'bloodType': 'A- Blood'},
    {'date': '29th June, 2024', 'event': 'Hospital Blood Donation Event', 'bloodType': 'B+ Blood'},
    {'date': '10th June, 2024', 'event': 'Red Cross Blood Donation Camp', 'bloodType': 'AB+ Blood'},
    {'date': '25th May, 2024', 'event': 'Neighborhood Blood Donation', 'bloodType': 'O- Blood'},
    {'date': '1st May, 2024', 'event': 'Charity Blood Donation Event', 'bloodType': 'B- Blood'},
    {'date': '15th April, 2024', 'event': 'Corporate Blood Drive', 'bloodType': 'A+ Blood'},
    {'date': '5th April, 2024', 'event': 'School Blood Donation Event', 'bloodType': 'AB- Blood'},
    {'date': '20th March, 2024', 'event': 'Local Blood Donation Camp', 'bloodType': 'O+ Blood'},
    {'date': '10th March, 2024', 'event': 'Emergency Blood Donation', 'bloodType': 'B+ Blood'},
    {'date': '28th February, 2024', 'event': 'University Blood Donation Event', 'bloodType': 'A- Blood'},
    {'date': '15th February, 2024', 'event': 'Community Center Blood Drive', 'bloodType': 'O+ Blood'},
  ];

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

            // List of Donation History Cards using ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: donations.length,
                itemBuilder: (context, index) {
                  final donation = donations[index];
                  return _buildDonationCard(
                    donation['date']!,
                    donation['event']!,
                    donation['bloodType']!,
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationCard(String date, String event, String bloodType, BuildContext context) {
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DonationDetailScreen(
                date: date,
                event: event,
                bloodType: bloodType, location: '', notes: '',
              ),
            ),
          );
        },
      ),
    );
  }
}

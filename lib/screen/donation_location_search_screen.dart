import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'blood_bank_detail_screen.dart'; // Import the detail screen

class LocationSearchScreen extends StatelessWidget {
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
                  Icons.location_on,
                  color: Colors.redAccent,
                  size: 28.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Nearby Blood Banks',
                  style: GoogleFonts.lato(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h), // Responsive spacing

            // Map Container with shadow and gradient
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.w,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Map Placeholder',
                  style: GoogleFonts.lato(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h), // Responsive spacing

            // List of Blood Banks
            Expanded(
              child: ListView.builder(
                itemCount: _bankData.length, // Use your data length here
                itemBuilder: (context, index) {
                  final bank = _bankData[index];
                  return _buildBankCard(
                    bank['name']!,
                    bank['address']!,
                    bank['distance']!,
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

  Widget _buildBankCard(String name, String address, String distance, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: Icon(
          Icons.local_hospital,
          color: Colors.redAccent,
          size: 28.w,
        ),
        title: Text(
          name,
          style: GoogleFonts.lato(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          '$address\n$distance',
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
              builder: (context) => BloodBankDetailScreen(
                name: name,
                address: address,
                distance: distance, phoneNumber: '', email: '',  hours: '',
              ),
            ),
          );
        },
      ),
    );
  }
}

const _bankData = [
  {'name': 'Red Cross Blood Bank', 'address': '123 Main St', 'distance': '5.2 km away'},
  {'name': 'Local Blood Bank', 'address': '456 Elm St', 'distance': '2.8 km away'},
  {'name': 'City Hospital Blood Bank', 'address': '789 Oak St', 'distance': '4.1 km away'},
];

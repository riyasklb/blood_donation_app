import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nearby Blood Banks',
            style: GoogleFonts.lato(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h), // Responsive spacing
          Container(
            height: 200.h,
            color: Colors.grey[300],
            child: Center(child: Text('Map Placeholder', style: GoogleFonts.lato(fontSize: 18.sp))),
          ),
          SizedBox(height: 20.h), // Responsive spacing
          Expanded(
            child: ListView(
              children: [
                _buildBankCard('Red Cross Blood Bank', '123 Main St', '5.2 km away'),
                _buildBankCard('Local Blood Bank', '456 Elm St', '2.8 km away'),
                _buildBankCard('City Hospital Blood Bank', '789 Oak St', '4.1 km away'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankCard(String name, String address, String distance) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          name,
          style: GoogleFonts.lato(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '$address\n$distance',
          style: GoogleFonts.lato(fontSize: 16.sp),
        ),
      ),
    );
  }
}

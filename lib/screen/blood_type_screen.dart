import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blood_donation_app/theme/app_color.dart'; // Ensure this import matches your actual path

class BloodTypeScreen extends StatelessWidget {
  final List<String> bloodTypes = [
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Your Blood Type',
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 2.5,
          ),
          itemCount: bloodTypes.length,
          itemBuilder: (context, index) {
            return _buildBloodTypeCard(context, bloodTypes[index]);
          },
        ),
      ),
    );
  }

  Widget _buildBloodTypeCard(BuildContext context, String bloodType) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: InkWell(
        onTap: () {
          // Handle blood type selection
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected Blood Type: $bloodType')),
          );
        },
        child: Center(
          child: Text(
            bloodType,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

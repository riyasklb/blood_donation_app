import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController(); // Add this controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _buildProfilePicture(),
            SizedBox(height: 32.h),
            _buildTextField('Name', 'Enter your name', _nameController, Icons.person),
            SizedBox(height: 16.h),
            _buildTextField('Email', 'Enter your email', _emailController, Icons.email),
            SizedBox(height: 16.h),
            _buildTextField('Phone', 'Enter your phone number', _phoneController, Icons.phone),
            SizedBox(height: 16.h),
            _buildTextField('Address', 'Enter your address', _addressController, Icons.location_on),
            SizedBox(height: 16.h),
            _buildTextField('Date of Birth', 'Enter your date of birth', _dobController, Icons.calendar_today),
            SizedBox(height: 16.h),
            _buildTextField('Blood Group', 'Enter your blood group', _bloodGroupController, Icons.bloodtype), // Add this field
            SizedBox(height: 32.h),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle save profile action
                  Get.back();
                },
                icon: Icon(Icons.save, color: Colors.white, size: 22.w),
                label: Text(
                  'Save Changes',
                  style: GoogleFonts.lato(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60.w,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage('https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=1024x1024&w=is&k=20&c=iGtRKCTRSvPVl3eOIpzzse5SvQFfImkV0TZuFh-74ps='),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // Handle change profile picture action
              },
              child: Container(
                height: 40.w,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.w),
                ),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 22.w),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.red, size: 22.w),
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.w),
              borderSide: BorderSide(color: Colors.red),  // Border color set to red
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.w),
              borderSide: BorderSide(color: Colors.red),  // Focused border color set to red
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.w),
              borderSide: BorderSide(color: Colors.grey),  // Enabled border color set to grey
            ),
          ),
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}

import 'package:blood_donation_app/widget/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FindUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Find User',
          style: GoogleFonts.montserrat(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [kheight10,
            // Search bar
            TextField(
              decoration: InputDecoration(
                labelText: 'Search by User ID or Blood Group',
                labelStyle: GoogleFonts.montserrat(fontSize: 16.sp, color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.w),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                    width: 1.0.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.w),
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                    width: 1.0.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.w),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.5.w,
                  ),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.red),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            kheight10,
            // Display the list of users
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual count of search results
                itemBuilder: (context, index) {
                  return _buildUserTile(
                    name: 'User $index',
                    bloodGroup: 'O+',
                    location: 'Location $index',
                    context: context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTile({
    required String name,
    required String bloodGroup,
    required String location,
    required BuildContext context,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 248, 153, 153).withOpacity(0.1),
          ),
          child: CircleAvatar(backgroundImage: AppConstants.profileImage,)
          // Icon(
          //   Icons.person,
          //   size: 40.w,
          //   color: Colors.redAccent,
          // ),
        ),
        title: Text(
          name,
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Text(
              'Blood Group: $bloodGroup',
              style: GoogleFonts.montserrat(fontSize: 14.sp, color: Colors.grey[700]),
            ),
            Text(
              'Location: $location',
              style: GoogleFonts.montserrat(fontSize: 14.sp, color: Colors.grey[700]),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Handle connect action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          ),
          child: Text(
            'Connect',
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FindUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find User', style: GoogleFonts.montserrat()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar or filters can be added here
           TextField(
  decoration: InputDecoration(
    labelText: 'Search by User ID or Blood Group',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.w),
      borderSide: BorderSide(
        color: Colors.grey, // Set the border color to gray
        width: 1.0.w, // Optional: Set the border width
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.w),
      borderSide: BorderSide(
        color: Colors.grey, // Border color when the TextField is not focused
        width: 1.0.w,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.w),
      borderSide: BorderSide(
        color: Colors.grey, // Border color when the TextField is focused
        width: 1.5.w,
      ),
    ),
    prefixIcon: Icon(Icons.search),
  ),
),

            SizedBox(height: 20.h),
            // Display the list of users or search results here
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual count of search results
                itemBuilder: (context, index) {
                  return _buildUserTile('User $index', 'O+', 'Location $index', context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTile(String name, String bloodGroup, String location, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      elevation: 4,
      shadowColor: Colors.black26,
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: Icon(Icons.person, size: 40.w, color: Colors.redAccent),
        title: Text(
          name,
          style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Blood Group: $bloodGroup'),
            Text('Location: $location'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Handle connect action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w),
            ),
          ),
          child: Text(
            'Connect',
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

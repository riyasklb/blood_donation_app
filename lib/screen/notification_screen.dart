import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<String> notifications = [
    "New blood donation camp scheduled for tomorrow.",
    "Update: Blood donation guidelines have changed.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.lato(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 24.w,
                  child: Icon(
                    Icons.notification_important,
                    color: Colors.white,
                    size: 24.w,
                  ),
                ),
                title: Text(
                  notifications[index],
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20.w,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

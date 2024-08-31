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
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                notifications[index],
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                ),
              ),
              contentPadding: EdgeInsets.all(8.0),
              leading: Icon(Icons.notification_important),
            ),
          );
        },
      ),
    );
  }
}

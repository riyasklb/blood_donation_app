import 'package:blood_donation_app/widget/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodBankDetailScreen extends StatelessWidget {
  final String name;
  final String address;
  final String distance;
  final String phoneNumber;
  final String email;
  final String hours;

  BloodBankDetailScreen({
    required this.name,
    required this.address,
    required this.distance,
    required this.phoneNumber,
    required this.email,
    required this.hours,
  });

  Future<void> _launchMap() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=37.7749,-122.4194';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // You can handle the error more gracefully here
      print('Could not launch $url');
    }
  }
final String no="9633749714";
  Future<void> _launchPhone() async {
    final url = 'tel:$no';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // You can handle the error more gracefully here
      print('Could not launch $url');
    }
  }

  Future<void> _launchEmail() async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // You can handle the error more gracefully here
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank Details', style: GoogleFonts.lato()),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [kheight30,
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.lato(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Address: $address',
                        style: GoogleFonts.lato(
                          fontSize: 18.sp,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Distance: $distance',
                        style: GoogleFonts.lato(
                          fontSize: 18.sp,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Hours: $hours',
                        style: GoogleFonts.lato(
                          fontSize: 18.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ElevatedButton.icon(
            onPressed: _launchPhone,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              //padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            icon: Icon(Icons.phone, size: 20.sp),
            label: Text(
              'Call Blood Bank',
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          ElevatedButton.icon(
            onPressed: _launchEmail,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
           //   padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            icon: Icon(Icons.email, size: 20.sp),
            label: Text(
              'Email Blood Bank',
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          ElevatedButton.icon(
            onPressed: _launchMap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
             // padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            icon: Icon(Icons.directions, size: 20.sp),
            label: Text(
              'Get Directions',
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

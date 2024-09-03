import 'package:blood_donation_app/screen/bottumn_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatefulWidget {
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after 3 seconds
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {
        Get.off(BloodDonationHomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset(
              'assets/images/Animation - 1725348779479.json', // Make sure the file is added to your assets
              width: 250.w,
              height: 300.h,
              fit: BoxFit.cover,
              repeat: false, // The animation only plays once
            ),
            // Success animation
           
            SizedBox(height: 20.h),
            // Success message
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Success!',
                      style: GoogleFonts.lato(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        textStyle: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.redAccent.withOpacity(0.1),
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Your operation was completed successfully.',
                      style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.h),
            // Go to Home button
            // ElevatedButton(
            //   onPressed: () {
            //     Get.offAll(BloodDonationHomeScreen());
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 14.h),
            //     backgroundColor: Colors.red,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12.r),
            //     ),
            //     elevation: 5,
            //   ),
            //   child: Text(
            //     'Go to Home',
            //     style: GoogleFonts.lato(
            //       fontSize: 18.sp,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20.h),
            // Perform another action button
            TextButton(
              onPressed: () {
                // Handle another action
              },
              child: Text(
                'Perform Another Action',
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

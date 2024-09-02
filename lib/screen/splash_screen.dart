import 'package:blood_donation_app/routes/app_route_constants.dart';
import 'package:blood_donation_app/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Initialize fade-in animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after 3 seconds
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {
      Get.off(OtpScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Center content with animation
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo or icon
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 100.w,  // Adjust size with ScreenUtil
                  ),
                  SizedBox(height: 16.h),
                  // App title
                  Text(
                    'Blood Donation App',
                    style: GoogleFonts.lato(
                      fontSize: 26.sp,  // Responsive font size
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Loading indicator
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

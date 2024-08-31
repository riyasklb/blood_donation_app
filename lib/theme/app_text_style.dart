import 'package:blood_donation_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle heading = GoogleFonts.lato(
    fontSize: 24.sp,  // Responsive font size
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle subHeading = GoogleFonts.lato(
    fontSize: 20.sp,  // Responsive font size
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body = GoogleFonts.lato(
    fontSize: 16.sp,  // Responsive font size
    color: AppColors.textPrimary,
  );

  static TextStyle caption = GoogleFonts.lato(
    fontSize: 14.sp,  // Responsive font size
    color: AppColors.textSecondary,
  );
}

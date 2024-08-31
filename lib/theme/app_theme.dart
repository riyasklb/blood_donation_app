import 'package:blood_donation_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
        backgroundColor: AppColors.background,
        accentColor: AppColors.secondary,
      ).copyWith(
        secondary: AppColors.secondary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          fontSize: 24.sp, // Responsive font size
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 16.sp, // Responsive font size
          color: AppColors.textPrimary,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.lato(
          fontSize: 20.sp, // Responsive font size
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}

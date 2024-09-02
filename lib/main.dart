import 'package:blood_donation_app/routes/app_route_config.dart';
import 'package:blood_donation_app/screen/bottumn_nav_bar.dart';
import 'package:blood_donation_app/screen/home_scree.dart';
import 'package:blood_donation_app/screen/splash_screen.dart';
import 'package:blood_donation_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(500, 800), // Moto G82 approximate dimensions
      builder: (context, child) => GetMaterialApp(home:SplashScreen() ,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}

import 'package:blood_donation_app/screen/blood_donate_screen.dart';
import 'package:blood_donation_app/screen/request_for_blood.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final List<String> sliderImages = [
    'https://media.istockphoto.com/id/1394204936/photo/blood-donation-concept-give-blood-save-up-to-three-lives.jpg?s=2048x2048&w=is&k=20&c=OiJsm8-TJ2zMGb-VcOM3vxV0MsSCUt-fKvDMO9bIokw=',
    'https://media.istockphoto.com/id/1315395944/photo/experienced-phlebotomist-preparing-a-woman-for-blood-draw.jpg?s=2048x2048&w=is&k=20&c=doNgoEwtSdigjH6MmvL0YTTD3FOu_Sf7Iet0jl_cym0=',
    'https://media.istockphoto.com/id/1256555401/vector/blood-donation-concept.jpg?s=612x612&w=0&k=20&c=OKESllI31Ny0H4CTABQgayI230R2o4tvCEE8RkSULpI=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slider Section
            CarouselSlider(
              items: sliderImages.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 180.h,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(height: 20.h),

            // User ID and Blood Group Section
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.w,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'USAVER-752361',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'USER ID',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.bloodtype,
                        color: Colors.white,
                        size: 40.w,
                      ),
                      Text(
                        'O+',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h), // Increased spacing for better UI

            // Buttons for Requesting Blood and Donating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.bloodtype,
                  label: 'Request for Blood',
                  onTap: () {
                    Get.to(RequestForBloodScreen());
                  },
                ),
                _buildActionButton(
                  context,
                  icon: Icons.volunteer_activism,
                  label: 'Donate',
                  onTap: () {
                    Get.to(ReceiversListScreen());
                  },
                ),
              ],
            ),
            SizedBox(height: 30.h),

            // Blood Request List
            Expanded(
              child: ListView(
                children: [
                  _buildBloodRequestTile('Anushka', '1 Unit (Blood)', 'Ernakulam', 'Critical', 'Thursday, Nov 21', context),
                  // Add more blood request tiles here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        shadowColor: Colors.black38,
        elevation: 8,
      ),
      onPressed: onTap,
      child: Column(
        children: [
          Icon(icon, size: 28.w, color: Colors.white),
          SizedBox(height: 8.h),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBloodRequestTile(String name, String units, String location, String status, String date, BuildContext context) {
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
            Text(units),
            Text(location),
            Text(date),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Handle accept action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: status == 'Critical' ? Colors.red : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w),
            ),
          ),
          child: Text(
            status,
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

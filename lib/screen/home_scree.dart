import 'package:blood_donation_app/screen/blood_donate_screen.dart';
import 'package:blood_donation_app/screen/donation_sceduling_screen.dart';
import 'package:blood_donation_app/screen/find_user_screen.dart';
import 'package:blood_donation_app/screen/request_for_blood.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
        child: ListView(
          children: [
            Column(
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
                    height: 130.h,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
                SizedBox(height: 20.h),
            
                // User ID and Blood Group Section with Lottie animation
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        //blurRadius: 1.w,
                        offset: Offset(0, 1.h),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'USAVER-752361',
                            style: GoogleFonts.montserrat(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Blood Group : ',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                          Text(
                            'O+',
                            style: GoogleFonts.montserrat(
                              fontSize: 20.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          ),   ],
                          ),
                           
                        ],
                      ),
                      Column(
                        children: [
                          Lottie.asset(
                            'assets/images/Animation - 1725356700953.json',
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.fitHeight,
                          )
                        
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h), // Increased spacing for better UI
            
                // Buttons for Requesting Blood and Donating with Lottie animations
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      context,
                      icon: Icons.bloodtype,
                      label: 'Request for Blood',
                      lottiePath: 'assets/images/Animation - 1725356627092.json',
                      onTap: () {
                        Get.to(RequestForBloodScreen());
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.volunteer_activism,
                      label: 'Donate your blood',
                      lottiePath: 'assets/images/Animation - 1725360958065.json',
                      onTap: () {
                        Get.to(ReceiversListScreen());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
            
                // Blood Request List
                _buildBloodRequestTile('Anushka', '1 Unit (Blood)', 'Ernakulam', 'Critical', 'Thursday, Nov 21', context),

  SizedBox(height: 30.h),


                Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
   
    _buildActionButton(
      context,
      icon: Icons.volunteer_activism,
      label: 'Donation Scheduling',
      lottiePath: 'assets/images/Animation - 1725360958065.json',
      onTap: () {
        Get.to(DonationSchedulingScreen());
      },
    ),
    _buildActionButton(
      context,
      icon: Icons.search,
      label: '  Find for the User  ',
      lottiePath: 'assets/images/Animation - 1725361685732.json', // Add your Lottie animation path
      onTap: () {
       Get.to(FindUserScreen()); // Implement this screen
      },
    ),
  ],
),
  SizedBox(height: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required String lottiePath, required VoidCallback onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        shadowColor: const Color.fromARGB(57, 158, 158, 158),
        elevation: 3,
      ),
      onPressed: onTap,
      child: Column(
        children: [
          Lottie.asset(
            lottiePath,
            width: 100.w,
            height: 100.h,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 15.sp,
              color: Colors.black,fontWeight: FontWeight.w600
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

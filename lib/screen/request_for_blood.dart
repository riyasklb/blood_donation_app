import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestForBloodScreen extends StatefulWidget {
  @override
  _RequestForBloodScreenState createState() => _RequestForBloodScreenState();
}

class _RequestForBloodScreenState extends State<RequestForBloodScreen> {
  String? selectedBloodType;
  String? selectedBloodGroup;
  String? selectedUnits;

  final List<String> bloodTypes = ['Whole Blood', 'Platelets', 'Plasma'];
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final List<String> units = ['1 Unit', '2 Units', '3 Units', '4 Units'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request for Blood',
          style: GoogleFonts.lato(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownField('Select Blood Type', bloodTypes, selectedBloodType, (value) {
                setState(() {
                  selectedBloodType = value;
                });
              }),
              SizedBox(height: 16.h),
              _buildTextField('Patient First Name', Icons.person),
              SizedBox(height: 16.h),
              _buildTextField('Attendee Mobile Number', Icons.phone),
              SizedBox(height: 16.h),
              _buildDropdownField('Select Blood Group', bloodGroups, selectedBloodGroup, (value) {
                setState(() {
                  selectedBloodGroup = value;
                });
              }),
              SizedBox(height: 16.h),
              _buildDateField('Required Date'),
              SizedBox(height: 16.h),
              _buildDropdownField('Select Units', units, selectedUnits, (value) {
                setState(() {
                  selectedUnits = value;
                });
              }),
              SizedBox(height: 16.h),
              _buildTextField('Please select location', Icons.location_on),
              SizedBox(height: 16.h),
              _buildSwitchField('Critical'),
              SizedBox(height: 16.h),
              _buildTextField('Additional note to potential donors', Icons.note),
              SizedBox(height: 16.h),
              _buildCheckboxField(),
              SizedBox(height: 24.h),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, [IconData? icon]) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.w),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lato(fontSize: 16.sp, color: Colors.grey[700]),
          prefixIcon: icon != null ? Icon(icon, size: 20.w, color: Colors.red) : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hintText, List<String> items, String? selectedItem, ValueChanged<String?> onChanged) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.w),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lato(fontSize: 16.sp, color: Colors.grey[700]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: GoogleFonts.lato(fontSize: 16.sp, color: Colors.black),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        dropdownColor: Colors.white,
        iconEnabledColor: Colors.red,
      ),
    );
  }

  Widget _buildDateField(String hintText) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.w),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lato(fontSize: 16.sp, color: Colors.grey[700]),
          prefixIcon: Icon(Icons.calendar_today, size: 20.w, color: Colors.red),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
        onTap: () {
          // Implement date picker logic here
        },
      ),
    );
  }

  Widget _buildSwitchField(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(fontSize: 16.sp),
        ),
        Switch(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.red,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'I have read and agreed to these ',
              style: GoogleFonts.lato(fontSize: 14.sp),
              children: [
                TextSpan(
                  text: 'Terms of Use and Privacy Policy',
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.w),
          ),
          elevation: 4.0,
        ),
        child: Text(
          'Send Request',
          style: GoogleFonts.lato(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

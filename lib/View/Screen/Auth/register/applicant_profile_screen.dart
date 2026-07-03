import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/applicant_profile_controller.dart';

class ApplicantProfileScreen extends StatelessWidget {
  const ApplicantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApplicantProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 48.w,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryNavy,
            size: 20.r,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "APPLICANT PROFILE",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryNavy,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: const Color(0xFFF1F5F9),
            height: 1.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Photo Upload Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1.w,
                ),
              ),
              child: Column(
                children: [
                  // Profile Photo Placeholder
                  Stack(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Icon(
                          Icons.person_outline,
                          size: 40.r,
                          color: AppColors.textMuted,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryNavy,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 14.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Applicant Photo",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Upload a clear passport-style headshot\nfor the ID card.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textMuted,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20.h),
            
            // Full Name Input
            _buildLabel("Full Name"),
            _buildTextField(hintText: "Legal name as per ID"),
            
            // Date of Birth Input
            _buildLabel("Date of Birth"),
            _buildTextField(hintText: "mm/dd/yyyy"),
            
            // Minor Applicant Warning Notice Box
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECE9), // Soft orange/pink background matching design
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xFFFFD4CE),
                  width: 0.8.w,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: const Color(0xFFC2410C),
                    size: 20.r,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "Minor Applicant: If you are under 18 years of age, a Parent/Guardian profile must be completed and linked to this registration after this step.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF7C2D12),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24.h),
            
            // Personal Details Section Header
            Text(
              "PERSONAL DETAILS",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              width: double.infinity,
              height: 1.h,
              color: const Color(0xFFE2E8F0),
            ),
            
            SizedBox(height: 20.h),
            
            // Gender Dropdown
            _buildLabel("Gender"),
            Obx(() => Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 8.h, bottom: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.selectedGender.value,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textMuted,
                    size: 22.r,
                  ),
                  elevation: 1,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryNavy,
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.setGender(newValue);
                    }
                  },
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            )),
            
            // Phone Number Input
            _buildLabel("Phone Number"),
            _buildTextField(hintText: "+61 000 000 000"),
            
            // Email Address Input
            _buildLabel("Email Address"),
            _buildTextField(hintText: "athlete@example.com"),
            
            // Residential Address Input
            _buildLabel("Residential Address"),
            _buildTextField(hintText: "Street Address, City, State, ZIP"),
            
            SizedBox(height: 12.h),
            
            // Emergency Contact Section Box
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC), // Muted grey/blue background card
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 0.8.w,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "★ EMERGENCY CONTACT",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  
                  // Contact Name
                  _buildSubLabel("Contact Name"),
                  _buildSubTextField(hintText: "Full name"),
                  
                  // Relationship
                  _buildSubLabel("Relationship"),
                  _buildSubTextField(hintText: "e.g. Parent, Spouse"),
                  
                  // Emergency Phone
                  _buildSubLabel("Emergency Phone"),
                  _buildSubTextField(hintText: "+61 000 000 000"),
                ],
              ),
            ),
            
            SizedBox(height: 32.h),
            
            // Complete Registration Button
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoute.parentProfile),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryGreen,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 54.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "COMPLETE REGISTRATION",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryNavy,
      ),
    );
  }

  Widget _buildSubLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryNavy,
      ),
    );
  }

  Widget _buildTextField({required String hintText}) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textMuted,
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.primaryNavy,
        ),
      ),
    );
  }

  Widget _buildSubTextField({required String hintText}) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textMuted,
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.primaryNavy,
        ),
      ),
    );
  }
}

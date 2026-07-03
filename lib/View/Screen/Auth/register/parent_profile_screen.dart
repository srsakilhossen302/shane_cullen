import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/parent_profile_controller.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ParentProfileController());

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
          "PARENT/GUARDIAN PROFILE",
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
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name Input
            _buildLabel("FULL NAME"),
            _buildTextField(hintText: "Enter legal name"),
            
            // Date of Birth Input
            _buildLabel("DATE OF BIRTH"),
            _buildTextField(hintText: "mm/dd/yyyy"),
            
            // Gender Input
            _buildLabel("GENDER"),
            SizedBox(height: 8.h),
            Obx(() => Row(
              children: [
                Expanded(
                  child: _buildGenderButton(
                    label: "Male",
                    isSelected: controller.selectedGender.value == "Male",
                    onTap: () => controller.setGender("Male"),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildGenderButton(
                    label: "Female",
                    isSelected: controller.selectedGender.value == "Female",
                    onTap: () => controller.setGender("Female"),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildGenderButton(
                    label: "Other",
                    isSelected: controller.selectedGender.value == "Other",
                    onTap: () => controller.setGender("Other"),
                  ),
                ),
              ],
            )),
            
            SizedBox(height: 20.h),
            
            // Phone Number Input (Custom layout with prefix container on the left)
            _buildLabel("PHONE NUMBER"),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0), // Soft grey background
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9.r),
                        bottomLeft: Radius.circular(9.r),
                      ),
                    ),
                    child: Text(
                      "+61",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "400 000 000",
                        hintStyle: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20.h),
            
            // Email Address Input
            _buildLabel("EMAIL ADDRESS"),
            _buildTextField(hintText: "name@example.com"),
            
            SizedBox(height: 36.h),
            
            // Complete Registration Button
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () => controller.completeRegistration(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryGreen,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 54.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "COMPLETE REGISTRATION",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
            )),
            
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
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryNavy,
        letterSpacing: 0.5,
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

  Widget _buildGenderButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xFFE2E8F0),
            width: 1.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.primaryNavy,
          ),
        ),
      ),
    );
  }
}

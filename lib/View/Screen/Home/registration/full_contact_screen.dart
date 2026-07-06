import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../model/event_model.dart';
import 'controller/full_contact_controller.dart';

class FullContactScreen extends StatelessWidget {
  const FullContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve passed EventModel argument
    final EventModel event = Get.arguments as EventModel;
    final controller = Get.put(FullContactController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: AppColors.secondaryGreen,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "REGISTRATION CATEGORY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Select from the nominated categories",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              "FULL CONTACT",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              width: double.infinity,
              height: 1.5.h,
              color: AppColors.secondaryGreen,
            ),
            
            SizedBox(height: 20.h),

            // Section 1: MALE OPEN
            _buildSectionHeader(Icons.male, "MALE OPEN"),
            SizedBox(height: 12.h),
            
            Obx(() => _buildDivisionCard(
                  divisionCode: "DIVISION M1",
                  title: "Lightweight",
                  subtitle: "Up to 70kg",
                  progress: 0.35,
                  isSelected: controller.selectedDivision.value == "M1",
                  onTap: () => controller.selectDivision("M1"),
                  onRegister: () => Get.toNamed(AppRoute.nonContact, arguments: event),
                )),
            SizedBox(height: 12.h),
            Obx(() => _buildDivisionCard(
                  divisionCode: "DIVISION M2",
                  title: "Middleweight",
                  subtitle: "70.1kg — 80kg",
                  progress: 0.80,
                  isSelected: controller.selectedDivision.value == "M2",
                  onTap: () => controller.selectDivision("M2"),
                  onRegister: () => Get.toNamed(AppRoute.nonContact, arguments: event),
                )),
            SizedBox(height: 12.h),
            Obx(() => _buildDivisionCard(
                  divisionCode: "DIVISION M3",
                  title: "Heavyweight",
                  subtitle: "80.1kg+",
                  progress: 0.20,
                  isSelected: controller.selectedDivision.value == "M3",
                  onTap: () => controller.selectDivision("M3"),
                  onRegister: () => Get.toNamed(AppRoute.nonContact, arguments: event),
                )),

            SizedBox(height: 24.h),

            // Section 2: FEMALE OPEN
            _buildSectionHeader(Icons.female, "FEMALE OPEN"),
            SizedBox(height: 12.h),

            Obx(() => _buildDivisionCard(
                  divisionCode: "DIVISION F1",
                  title: "Lightweight",
                  subtitle: "Up to 70kg",
                  progress: 0.35,
                  isSelected: controller.selectedDivision.value == "F1",
                  onTap: () => controller.selectDivision("F1"),
                  onRegister: () => Get.toNamed(AppRoute.nonContact, arguments: event),
                )),
            SizedBox(height: 12.h),
            Obx(() => _buildDivisionCard(
                  divisionCode: "DIVISION F2",
                  title: "Middleweight",
                  subtitle: "70.1kg — 80kg",
                  progress: 0.15,
                  isSelected: controller.selectedDivision.value == "F2",
                  onTap: () => controller.selectDivision("F2"),
                  onRegister: () => Get.toNamed(AppRoute.nonContact, arguments: event),
                )),

            SizedBox(height: 28.h),

            // Tournament dynamic info card
            Container(
              padding: EdgeInsets.all(20.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryGreen,
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: const AssetImage("assets/images/martial_arts_sunset.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryGreen.withValues(alpha: 0.85),
                    BlendMode.srcATop,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title ?? "Name of Specific Tournament",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Completing in full contact competition application requires medical clearance.",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  
                  // Date
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, color: Colors.white, size: 16.r),
                      SizedBox(width: 8.w),
                      Text(
                        (event.date ?? "AUG 24-26, 2024").toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.white, size: 16.r),
                      SizedBox(width: 8.w),
                      Text(
                        (event.location ?? "AUCKLAND, NZ").toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: AppColors.secondaryGreen, size: 22.r),
        SizedBox(width: 6.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryGreen,
          ),
        ),
      ],
    );
  }

  Widget _buildDivisionCard({
    required String divisionCode,
    required String title,
    required String subtitle,
    required double progress,
    required bool isSelected,
    required VoidCallback onTap,
    required VoidCallback onRegister,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.secondaryGreen : const Color(0xFFE2E8F0),
            width: isSelected ? 2.w : 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.01),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Division Code
            Text(
              divisionCode,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
            SizedBox(height: 4.h),
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
            // Subtitle
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textMuted,
              ),
            ),
            SizedBox(height: 12.h),
            
            // Linear Progress Meter
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6.h,
                backgroundColor: const Color(0xFFF1F5F9),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryGreen),
              ),
            ),
            
            SizedBox(height: 16.h),
            
            // Register button
            ElevatedButton(
              onPressed: onRegister,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryGreen,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 40.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "REGISTER NOW",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

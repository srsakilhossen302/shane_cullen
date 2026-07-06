import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../model/event_model.dart';
import 'controller/camp_registration_controller.dart';

class CampRegistrationScreen extends StatelessWidget {
  const CampRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CampRegistrationController());
    final EventModel event = Get.arguments as EventModel;

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
              "CAMP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Join us for an unforgettable season of adventure and learning.",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 11.sp,
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
            // Title
            Text(
              "Camp Registration",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
            SizedBox(height: 16.h),

            // Training Camp Registration Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF), // Light purple
                border: Border.all(color: const Color(0xFFDDD6FE), width: 1.w),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Training Camp Registration",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF5B21B6), // Dark purple
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Complete your registration details for this training camp",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF7C3AED), // Muted purple
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Section 1: Camp Details
            Text(
              "Camp Details",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "⛺",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title ?? "Advanced Kyokushin Training Camp",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "Intensive 3-day training program",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  
                  // Date
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 16.r, color: const Color(0xFFEF4444)),
                      SizedBox(width: 10.w),
                      Text(
                        event.date ?? "May 10-12, 2026",
                        style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16.r, color: const Color(0xFF3B82F6)),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          event.location ?? "Sydney Olympic Park, Australia",
                          style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  // Fee
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined, size: 16.r, color: const Color(0xFF10B981)),
                      SizedBox(width: 10.w),
                      Text(
                        "Camp Fee: ${event.fee ?? "AUD 350"}",
                        style: TextStyle(fontSize: 13.sp, color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Section 2: Camp Schedule
            Text(
              "Camp Schedule",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Day 1
                  _buildScheduleItem(
                    day: "Day 1",
                    time: "9:00 AM - 5:00 PM",
                    activity: "Fundamentals & Kata",
                  ),
                  const Divider(color: Color(0xFFE2E8F0), height: 24),
                  
                  // Day 2
                  _buildScheduleItem(
                    day: "Day 2",
                    time: "9:00 AM - 5:00 PM",
                    activity: "Kumite & Conditioning",
                  ),
                  const Divider(color: Color(0xFFE2E8F0), height: 24),

                  // Day 3
                  _buildScheduleItem(
                    day: "Day 3",
                    time: "9:00 AM - 3:00 PM",
                    activity: "Grading & Certification",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Grading selection
            Obx(() {
              final isSelected = controller.intendToGrade.value;
              return GestureDetector(
                onTap: () => controller.toggleIntendToGrade(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBEB), // Soft yellow/cream
                    border: Border.all(
                      color: isSelected ? AppColors.secondaryGreen : const Color(0xFFFDE68A),
                      width: 1.5.w,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? AppColors.secondaryGreen : Colors.transparent,
                          border: Border.all(
                            color: isSelected ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
                            width: isSelected ? 4.w : 1.5.w,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          "Do you intend to grade?",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? AppColors.secondaryGreen : const Color(0xFFD97706),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 24.h),

            // Register button
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoute.reviewRegistration, arguments: event),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryGreen,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register Now",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(Icons.arrow_forward, size: 16.r),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem({
    required String day,
    required String time,
    required String activity,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF15803D), // Green text
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          time,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textMuted,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          activity,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryNavy,
          ),
        ),
      ],
    );
  }


}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shane_cullen/Utils/AppColors/app_colors.dart';
import '../model/event_model.dart';
import '../../../../Core/AppRoute/app_route.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the passed EventModel argument
    final EventModel event = Get.arguments as EventModel;

    // Generate dynamic stadium name based on the title
    final String stadiumName = event.title?.toUpperCase().contains("CHAMPIONSHIP") == true
        ? "NATIONAL SPORTS STADIUM"
        : "${event.title?.toUpperCase()} SPORTS CENTER";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image Stack with Floating Back Button
            Stack(
              children: [
                Image.asset(
                  event.imageUrl ?? 'assets/images/martial_arts_sunset.png',
                  width: double.infinity,
                  height: 340.h,
                  fit: BoxFit.cover,
                ),
                
                // Overlay back button
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Event Details Content Block
            Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    event.title ?? "",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  
                  // Thin divider line
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: const Color(0xFFF1F5F9),
                  ),
                  SizedBox(height: 16.h),
                  
                  // Location Row (Navy blue box + Stadium / city details)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: AppColors.primaryNavy,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stadiumName,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryNavy,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              event.location ?? "",
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
                  SizedBox(height: 20.h),
                  
                  // Map Mockup Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      "assets/images/map_placeholder.png",
                      width: double.infinity,
                      height: 180.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  
                  // Proceed to Registration Button
                  ElevatedButton(
                    onPressed: () => Get.toNamed(AppRoute.registrationCategory, arguments: event),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryGreen,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Proceed to Registration",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

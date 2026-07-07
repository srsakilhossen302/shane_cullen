import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';

class TournamentPerformanceScreen extends StatelessWidget {
  const TournamentPerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // Green Header Banner
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 24.h),
            decoration: const BoxDecoration(
              color: AppColors.secondaryGreen,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Arrow
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Shahriar Alom",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Black Belt • 2nd Dan",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Green Tournaments Count Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGreen,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondaryGreen.withValues(alpha: 0.2),
                          blurRadius: 8.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                          size: 24.r,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "2",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Tournaments",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // 2. Championship Info Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Oceania Open Martial Arts Championships",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16.r,
                              color: const Color(0xFF94A3B8),
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                "Dhaka, Dhaka Division, Bangladesh",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 16.r,
                              color: const Color(0xFF94A3B8),
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                "10 Jan, 2024 - 12 Jan, 2024",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // 3. Division Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.list_alt_rounded,
                              color: AppColors.secondaryGreen,
                              size: 20.r,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Division",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryGreen),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Full Contact Elite",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // 4. Performance Medal Count Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.stars_outlined,
                              color: AppColors.secondaryGreen,
                              size: 20.r,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Your Performance",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryGreen,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Medals Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMedalBox(
                              medalIcon: Icons.emoji_events,
                              medalColor: const Color(0xFFEAB308), // Gold
                              label: "1st",
                              count: "1",
                            ),
                            _buildMedalBox(
                              medalIcon: Icons.emoji_events,
                              medalColor: const Color(0xFF94A3B8), // Silver
                              label: "2nd",
                              count: "0",
                            ),
                            _buildMedalBox(
                              medalIcon: Icons.emoji_events,
                              medalColor: const Color(0xFFCA8A04), // Bronze
                              label: "3rd",
                              count: "0",
                            ),
                            _buildMedalBox(
                              medalIcon: Icons.cancel_outlined,
                              medalColor: const Color(0xFFCBD5E1), // Cancel/Not placed
                              label: "Not Placed",
                              count: "0",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedalBox({
    required IconData medalIcon,
    required Color medalColor,
    required String label,
    required String count,
  }) {
    return Container(
      width: 72.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            medalIcon,
            color: medalColor,
            size: 24.r,
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryGreen,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            count,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryNavy,
            ),
          ),
        ],
      ),
    );
  }
}

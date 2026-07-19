import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // 1. Top Green Header Banner (Back Button, Title, Subtitle)
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(24.w, 48.h, 24.w, 24.h),
            decoration: const BoxDecoration(
              color: AppColors.secondaryGreen,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Teams",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Manage your teams",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),

          // 2. Scrollable Body
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Action buttons Card (Create Team / Join Team)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 10.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Create Team Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.snackbar("Create Team", "Create team feature is coming soon!");
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFF6FF), // Light blue
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: const Color(0xFFBFDBFE)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: const Color(0xFF2563EB),
                                    size: 18.r,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Create Team",
                                    style: TextStyle(
                                      color: const Color(0xFF2563EB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // Join Team Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.snackbar("Join Team", "Join team search feature is coming soon!");
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0FDF4), // Light green
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: const Color(0xFFBBF7D0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_add_alt_1_outlined,
                                    color: const Color(0xFF16A34A),
                                    size: 18.r,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Join Team",
                                    style: TextStyle(
                                      color: const Color(0xFF16A34A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // "My Teams" Header
                  Text(
                    "My Teams",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // My Teams List
                  _buildMyTeamCard(
                    teamName: "Bangladesh Warriors",
                    membersCount: 12,
                    wins: 8,
                    losses: 2,
                    isCaptain: true,
                    avatarUrl: "https://cdn-icons-png.flaticon.com/512/3003/3003204.png", // Karate Gi representation
                  ),
                  _buildMyTeamCard(
                    teamName: "Dhaka Dragons",
                    membersCount: 15,
                    wins: 12,
                    losses: 5,
                    isCaptain: false,
                    avatarUrl: "https://cdn-icons-png.flaticon.com/512/555/555627.png", // Shield/Badge representation
                  ),
                  SizedBox(height: 28.h),

                  // "Available Teams" Header
                  Text(
                    "Available Teams",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Available Teams List
                  _buildAvailableTeamCard(
                    teamName: "City Champions",
                    location: "Dhaka",
                    membersCount: 10,
                    icon: Icons.emoji_events,
                    iconColor: const Color(0xFFF59E0B), // Trophy gold
                  ),
                  _buildAvailableTeamCard(
                    teamName: "Thunder Strike",
                    location: "Chittagong",
                    membersCount: 8,
                    icon: Icons.bolt,
                    iconColor: const Color(0xFFEAB308), // Lightning gold
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyTeamCard({
    required String teamName,
    required int membersCount,
    required int wins,
    required int losses,
    required bool isCaptain,
    required String avatarUrl,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Info Row (Avatar, Name, Captain Tag)
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                padding: EdgeInsets.all(6.r),
                child: Image.network(
                  avatarUrl,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.group),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          teamName,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                        ),
                        if (isCaptain) ...[
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF59E0B), // Orange gold
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10.r,
                                ),
                                SizedBox(width: 3.w),
                                Text(
                                  "Captain",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 14.r,
                          color: AppColors.textMuted,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "$membersCount members",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Stat boxes row
          Row(
            children: [
              // Wins box
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4), // Light green
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "$wins",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF16A34A),
                        ),
                      ),
                      Text(
                        "Wins",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xFF16A34A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Losses box
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF2F2), // Light red
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "$losses",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFDC2626),
                        ),
                      ),
                      Text(
                        "Losses",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xFFDC2626),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // View Team Details button
          ElevatedButton(
            onPressed: () {
              Get.snackbar(teamName, "Team details feature is coming soon!");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryNavy,
              minimumSize: Size(double.infinity, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              elevation: 0,
            ),
            child: Text(
              "View Team Details",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableTeamCard({
    required String teamName,
    required String location,
    required int membersCount,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
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
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24.r,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamName,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      location,
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
          Row(
            children: [
              Icon(
                Icons.people_outline,
                size: 16.r,
                color: AppColors.textMuted,
              ),
              SizedBox(width: 6.w),
              Text(
                "$membersCount members",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textMuted,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar("Join Requested", "Request to join $teamName sent!");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A), // Black
                  foregroundColor: Colors.white,
                  minimumSize: Size(90.w, 36.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Join",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

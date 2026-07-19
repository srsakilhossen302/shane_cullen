import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';

class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.karateIcon,
              width: 20.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryNavy,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "OfficialPortal",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: const Color(0xFFF1F5F9),
              backgroundImage: const NetworkImage(
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: const Color(0xFFF1F5F9),
            height: 1.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Verification Status Summary Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1.w,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "APPLICATION ID: #OFF-99281",
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMuted,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Verification Status",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                        ),
                        // Amber UnderReview badge
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7), // Light amber/yellow
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: const Color(0xFFF59E0B),
                              width: 0.5.w,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.sync,
                                color: const Color(0xFFD97706), // Dark amber
                                size: 14.r,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "UnderReview",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFD97706),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),

              // 2. QUALIFICATION DETAILS
              Text(
                "QUALIFICATION DETAILS",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMuted,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 12.h),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1.w,
                  ),
                ),
                child: Column(
                  children: [
                    // Item 1: Full Contact Judge -> Verified
                    _buildQualificationItem(
                      title: "Full Contact Judge",
                      description: "Class A Certification",
                      icon: Icons.gavel_outlined,
                      statusWidget: _buildStatusBadge(
                        text: "Verified",
                        textColor: const Color(0xFF10B981), // Green
                        icon: Icons.check_circle,
                        iconColor: const Color(0xFF10B981),
                      ),
                    ),
                    Divider(height: 1.h, color: const Color(0xFFF1F5F9)),

                    // Item 2: Kata Judge -> Pending
                    _buildQualificationItem(
                      title: "Kata Judge",
                      description: "Technical Review Pending",
                      icon: Icons.sports_kabaddi_outlined,
                      statusWidget: _buildStatusBadge(
                        text: "Pending",
                        textColor: const Color(0xFFD97706), // Gold/Amber
                        icon: Icons.access_time_filled,
                        iconColor: const Color(0xFFD97706),
                      ),
                    ),
                    Divider(height: 1.h, color: const Color(0xFFF1F5F9)),

                    // Item 3: Safety Officer -> Required (Alert red)
                    _buildQualificationItem(
                      title: "Safety Officer",
                      description: "Medical Waiver Expired",
                      icon: Icons.medical_services_outlined,
                      statusWidget: _buildStatusBadge(
                        text: "Required",
                        textColor: const Color(0xFFEF4444), // Red
                        icon: Icons.error,
                        iconColor: const Color(0xFFEF4444),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),

              // 3. Next Steps from Administration Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border(
                    left: BorderSide(
                      color: AppColors.secondaryGreen,
                      width: 4.w,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: const Color(0xFFB45309), // Amber gold
                          size: 18.r,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Next Steps from Administration",
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFB45309),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    // Description text with bold highlights
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          color: AppColors.primaryNavy,
                          height: 1.45,
                        ),
                        children: const [
                          TextSpan(
                            text: "Your primary judging credentials have been successfully validated against the regional database. However, your ",
                          ),
                          TextSpan(
                            text: "Safety Officer",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: " documentation requires a renewed medical clearance form from the current calendar year. Please upload the PDF via the 'Credentials' tab to finalize your full profile.",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Action Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to UploadDocumentScreen for Safety Officer
                        Get.toNamed(
                          AppRoute.uploadDocument,
                          arguments: {'qualificationName': 'Safety Officer'},
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F172A), // Black / very dark slate
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 44.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload Missing Documents",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.upload_file_outlined,
                            size: 16.r,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQualificationItem({
    required String title,
    required String description,
    required IconData icon,
    required Widget statusWidget,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          // Left Icon Container
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: AppColors.primaryNavy,
              size: 20.r,
            ),
          ),
          SizedBox(width: 14.w),

          // Details column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryNavy,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),

          // Right Status Widget
          statusWidget,
        ],
      ),
    );
  }

  Widget _buildStatusBadge({
    required String text,
    required Color textColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 14.r,
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

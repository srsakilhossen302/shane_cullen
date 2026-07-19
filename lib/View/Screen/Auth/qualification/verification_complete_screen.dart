import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';

class VerificationCompleteScreen extends StatelessWidget {
  const VerificationCompleteScreen({super.key});

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
          child: Container(color: const Color(0xFFF1F5F9), height: 1.h),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),

              // 1. Concentric Green Checkmark Circle
              Center(
                child: Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFECFDF5), // Light mint green
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFA7F3D0), // Slightly darker mint green border
                      width: 1.5.w,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 68.w,
                    height: 68.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD1FAE5),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      color: AppColors.secondaryGreen,
                      size: 36.r,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // 2. Titles
              Text(
                "Verification Complete",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryNavy,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Congratulations! Your credentials have been fully verified. You are now an active official in the Apex League.",
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    color: AppColors.textMuted,
                    height: 1.45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 48.h),

              // 3. APEX LEAGUE OFFICIAL ID Card - Wrap in GestureDetector to navigate to the Home Dashboard
              GestureDetector(
                onTap: () => Get.offAllNamed(AppRoute.competitionHistory),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 10.r,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Column(
                      children: [
                        // Thick Gold/Brown Top Header Border bar
                        Container(
                          width: double.infinity,
                          height: 6.h,
                          color: const Color(0xFF854D0E), // Gold/Brown color
                        ),
                        // ID Card body wrapped in a Stack for the faint watermark
                        Stack(
                          children: [
                            // Faint watermark logo in the bottom right corner
                            Positioned(
                              bottom: -24.h,
                              right: -10.w,
                              child: Text(
                                "9",
                                style: TextStyle(
                                  fontSize: 130.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFF8FAFC), // Faint watermark grey
                                ),
                              ),
                            ),

                            // ID Card details padding
                            Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ID Card Header
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "APEX LEAGUE",
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textMuted,
                                              letterSpacing: 0.8.w,
                                            ),
                                          ),
                                          Text(
                                            "OFFICIAL",
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textMuted,
                                              letterSpacing: 0.8.w,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // ACTIVE & VERIFIED Green Badge
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 5.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondaryGreen,
                                          borderRadius: BorderRadius.circular(20.r),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              color: Colors.white,
                                              size: 11.r,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              "ACTIVE & VERIFIED",
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),

                                  // Name
                                  Text(
                                    "Johnathan Doe",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryNavy,
                                      letterSpacing: -0.2.w,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),

                                  // Photo & Details Row
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Official Photo
                                      Container(
                                        width: 90.w,
                                        height: 90.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F5F9),
                                          borderRadius: BorderRadius.circular(10.r),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                              "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20.w),
                                      // ID details column
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ID Number",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.textMuted,
                                            ),
                                          ),
                                          Text(
                                            "#OFF-99281",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryNavy,
                                            ),
                                          ),
                                          SizedBox(height: 12.h),
                                          Text(
                                            "Expiry Date",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.textMuted,
                                            ),
                                          ),
                                          Text(
                                            "Dec 2025",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryNavy,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom padding space
              SizedBox(height: 48.h),
            ],
          ),
        ),
      ),
    );
  }
}

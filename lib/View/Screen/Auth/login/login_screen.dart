import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Utils/StaticString/static_string.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate or find the LoginController
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Top Header (Logo + Brand Text)
                        SizedBox(height: 32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.karateIcon,
                              width: 24.0.w,
                              height: 24.0.h,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryNavy,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              StaticString.akkaOceania,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryNavy,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        // Small horizontal divider line under header
                        Container(
                          width: 44.w,
                          height: 1.h,
                          color: AppColors.circleBorder,
                        ),
                        
                        SizedBox(height: 60.h),

                        // Center concentric circle graphic with green box and white karate icon
                        Center(
                          child: Container(
                            width: 210.w,
                            height: 210.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.circleBorder.withValues(alpha: 0.35),
                                width: 0.8.w,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              width: 175.w,
                              height: 175.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.circleBorder.withValues(alpha: 0.55),
                                  width: 0.8.w,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: 110.w,
                                height: 110.w,
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryGreen,
                                  borderRadius: BorderRadius.circular(26.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.secondaryGreen.withValues(alpha: 0.25),
                                      blurRadius: 16.r,
                                      offset: Offset(0, 8.h),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  AppIcons.karateIcon,
                                  width: 52.w,
                                  height: 52.h,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 48.h),

                        // Welcome & portal text
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.3, // Tighter line height matching mockup
                            ),
                            children: const [
                              TextSpan(
                                text: "WELCOME TO ",
                                style: TextStyle(color: AppColors.primaryNavy),
                              ),
                              TextSpan(
                                text: "AKKA (OCEANIA)\n",
                                style: TextStyle(color: AppColors.secondaryGreen),
                              ),
                              TextSpan(
                                text: "TOURNAMENT\n",
                                style: TextStyle(color: AppColors.primaryNavy),
                              ),
                              TextSpan(
                                text: "AND\n",
                                style: TextStyle(color: AppColors.primaryNavy),
                              ),
                              TextSpan(
                                text: "CAMP PORTAL",
                                style: TextStyle(color: AppColors.primaryNavy),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(flex: 1),

                        // Sign In Button
                        Obx(() => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () => controller.login("demo", "password"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryGreen,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 54.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            elevation: 0,
                          ),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(color: Colors.white)
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      StaticString.signIn,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Icon(Icons.arrow_forward, size: 18.r),
                                  ],
                                ),
                        )),

                        SizedBox(height: 48.h),

                        // Footer links
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => Get.toNamed(AppRoute.register),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50.w, 30.h),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                StaticString.createAccount,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                              child: const Text(
                                "•",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50.w, 30.h),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                StaticString.support,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

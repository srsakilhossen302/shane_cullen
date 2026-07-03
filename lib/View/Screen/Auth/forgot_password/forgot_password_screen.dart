import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Soft premium off-white/light blue background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Padding
              SizedBox(height: 24.h),
              
              // "Back to Sign In" top button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 18.r,
                        color: AppColors.primaryNavy,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Back to Sign In",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryNavy,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 36.h),
              
              // Title & Subtitle block
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryNavy,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "No worries! Enter your email and we'll send you reset instructions.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textMuted,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 36.h),
              
              // White Card containing the forgot password form
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 15,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 36.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      _buildLabel("Email Address"),
                      _buildTextField(
                        hintText: "you@example.com",
                        prefixIcon: Icons.mail_outline,
                      ),
                      
                      // Caption helper text below input
                      Text(
                        "We'll send a password reset link to this email address.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textMuted,
                        ),
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Send Reset Link Button
                      Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.sendResetLink("email"),
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
                                    "Send Reset Link",
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
                      
                      SizedBox(height: 36.h),
                      
                      // Footer: Remember your password? Sign In
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Remember your password? ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.secondaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryNavy,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9), // Soft premium grey background matching design theme
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textMuted,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.textMuted,
            size: 20.r,
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
}

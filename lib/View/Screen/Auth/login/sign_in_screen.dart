import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/login_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Find or instantiate the LoginController
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Soft premium off-white/light blue background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Padding
              SizedBox(height: 24.h),
              
              // "Back" top button
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
                        "Back",
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
                      "Sign In",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryNavy,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Welcome back! Please enter your details",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 36.h),
              
              // White Card containing the login form
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
                      
                      // Password Field
                      _buildLabel("Password"),
                      Obx(() => _buildTextField(
                        hintText: "••••••••",
                        prefixIcon: Icons.lock_outline,
                        obscureText: !controller.isPasswordVisible.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.textMuted,
                            size: 20.r,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      )),
                      
                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.secondaryGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Sign In Button
                      Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.login("email", "password"),
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
                                    "Sign In",
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
                      
                      // Footer: Don't have an account? Create Account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoute.register),
                            child: Text(
                              "Create Account",
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
    Widget? suffixIcon,
    bool obscureText = false,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9), // Soft premium grey background matching Register screen
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        obscureText: obscureText,
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
          suffixIcon: suffixIcon,
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

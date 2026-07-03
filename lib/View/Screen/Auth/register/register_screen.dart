import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

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
              
              SizedBox(height: 24.h),
              
              // Title & Subtitle block
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryNavy,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Start your competitive journey today",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 32.h),
              
              // White Card containing the form fields
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
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 32.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name Field
                      _buildLabel("Full Name"),
                      _buildTextField(
                        hintText: "John Doe",
                        prefixIcon: Icons.person_outline,
                      ),
                      
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
                      
                      // Confirm Password Field
                      _buildLabel("Confirm Password"),
                      Obx(() => _buildTextField(
                        hintText: "••••••••",
                        prefixIcon: Icons.lock_outline,
                        obscureText: !controller.isConfirmPasswordVisible.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isConfirmPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.textMuted,
                            size: 20.r,
                          ),
                          onPressed: controller.toggleConfirmPasswordVisibility,
                        ),
                      )),
                      
                      SizedBox(height: 8.h),
                      
                      // Terms and Privacy block
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textMuted,
                            height: 1.5,
                          ),
                          children: const [
                            TextSpan(text: "By creating an account, you agree to our "),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(
                                color: AppColors.secondaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: "\nand "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: AppColors.secondaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 32.h),
                      
                      // Create Account Button
                      Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.register("name", "email", "pass", "confirm"),
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
                                    "Create Account",
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
                      
                      SizedBox(height: 32.h),
                      
                      // Footer: Already have an account? Sign In
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
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
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
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
        color: const Color(0xFFF1F5F9), // Soft premium grey background matching design
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

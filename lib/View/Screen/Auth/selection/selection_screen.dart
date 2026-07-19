import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../register/controller/register_controller.dart';
import 'controller/selection_controller.dart';
import '../../../../helper/shared_prefe/shared_prefe.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Find or instantiate controllers
    final selectionController = Get.put(SelectionController());
    final registerController = Get.find<RegisterController>();

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
        title: Text(
          "Selection",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryNavy,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: const Color(0xFFF1F5F9),
            height: 1.h,
          ),
        ),
      ),
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
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),
                        // Title
                        Text(
                          "Choose your profile",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        // Subtitle
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            "Select how you will interact with the OfficialPortal platform.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textMuted,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 48.h),

                        // Match Official Option Card
                        Obx(() {
                          final isSelected = selectionController.selectedRole.value == 'Match Official';
                          return _buildRoleCard(
                            title: "Match Official",
                            icon: Icons.flag_rounded,
                            isSelected: isSelected,
                            onTap: () => selectionController.selectRole('Match Official'),
                          );
                        }),
                        SizedBox(height: 16.h),

                        // Competitor Option Card
                        Obx(() {
                          final isSelected = selectionController.selectedRole.value == 'Competitor';
                          return _buildRoleCard(
                            title: "Competitor",
                            icon: Icons.person_rounded,
                            isSelected: isSelected,
                            onTap: () => selectionController.selectRole('Competitor'),
                          );
                        }),

                        const Spacer(),

                        // CONTINUE Button
                        ElevatedButton(
                          onPressed: () async {
                            final role = selectionController.selectedRole.value;
                            registerController.selectedRole.value = role;
                            await PrefsHelper.setString(PrefsHelper.userRole, role);
                            Get.toNamed(AppRoute.register);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryGreen,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 54.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Footer note text
                        Text(
                          "You can switch roles later in your account settings.",
                          style: TextStyle(
                            fontSize: 10.5.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy.withValues(alpha: 0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
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

  Widget _buildRoleCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.secondaryGreen : const Color(0xFFE2E8F0),
            width: isSelected ? 1.8.w : 1.w,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.secondaryGreen.withValues(alpha: 0.1),
                    blurRadius: 8.r,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            // Icon container with soft background
            Container(
              width: 52.w,
              height: 52.w,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: isSelected ? AppColors.secondaryGreen : Colors.black87,
                size: 24.r,
              ),
            ),
            SizedBox(width: 16.w),
            // Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryNavy,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/qualification_management_controller.dart';

class QualificationManagementScreen extends StatelessWidget {
  const QualificationManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QualificationManagementController());

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
          "OfficialPortal",
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gold Certification Phase Header Label
              Row(
                children: [
                  Icon(
                    Icons.security_outlined,
                    color: const Color(0xFFB45309), // Amber gold
                    size: 16.r,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "CERTIFICATION PHASE",
                    style: TextStyle(
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB45309),
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Title
              Text(
                "Qualification Management",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryNavy,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 12.h),

              // Subtitle/Instruction description
              Text(
                "Select your official qualifications below. You must upload a valid certificate for each selection to proceed with league verification.",
                style: TextStyle(
                  fontSize: 13.5.sp,
                  color: AppColors.textMuted,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24.h),

              // Cards list containing the checkable options
              Obx(() => Column(
                    children: [
                      _buildCheckableCard(
                        title: "Full Contact Judge",
                        description: "High-impact officiating certification",
                        icon: Icons.gavel_outlined,
                        isChecked: controller.isFullContactJudge.value,
                        onTap: () => Get.toNamed(AppRoute.uploadDocument, arguments: {'qualificationName': 'Full Contact Judge'}),
                      ),
                      SizedBox(height: 12.h),
                      _buildCheckableCard(
                        title: "Full Contact Referee",
                        description: "In-ring match direction authority",
                        icon: Icons.flag_outlined,
                        isChecked: controller.isFullContactReferee.value,
                        onTap: () => Get.toNamed(AppRoute.uploadDocument, arguments: {'qualificationName': 'Full Contact Referee'}),
                      ),
                      SizedBox(height: 12.h),
                      _buildCheckableCard(
                        title: "Kata Judge",
                        description: "Form and technique evaluation specialist",
                        icon: Icons.sports_kabaddi_outlined,
                        isChecked: controller.isKataJudge.value,
                        onTap: () => Get.toNamed(AppRoute.uploadDocument, arguments: {'qualificationName': 'Kata Judge'}),
                      ),
                      SizedBox(height: 12.h),
                      _buildCheckableCard(
                        title: "Padded Contact Judge",
                        description: "Safety-oriented technical scoring",
                        icon: Icons.shield_outlined,
                        isChecked: controller.isPaddedContactJudge.value,
                        onTap: () => Get.toNamed(AppRoute.uploadDocument, arguments: {'qualificationName': 'Padded Contact Judge'}),
                      ),
                      SizedBox(height: 12.h),
                      _buildCheckableCard(
                        title: "Padded Contact Referee",
                        description: "Standard youth and amateur match official",
                        icon: Icons.campaign_outlined, // whistle placeholder
                        isChecked: controller.isPaddedContactReferee.value,
                        onTap: () => Get.toNamed(AppRoute.uploadDocument, arguments: {'qualificationName': 'Padded Contact Referee'}),
                      ),
                      SizedBox(height: 12.h),
                      _buildCheckableCard(
                        title: "Non Contact Judge",
                        description: "Entry-level technical officiating",
                        icon: Icons.fact_check_outlined,
                        isChecked: controller.isNonContactJudge.value,
                        onTap: () => Get.toNamed(AppRoute.uploadDocument, arguments: {'qualificationName': 'Non Contact Judge'}),
                      ),
                    ],
                  )),

              SizedBox(height: 28.h),

              // Bottom Verification Box
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4), // Very soft green background
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFFDCFCE7),
                    width: 1.w,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Verification Check Icon Circle
                        Container(
                          width: 42.w,
                          height: 42.w,
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryGreen,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.verified_outlined,
                            color: Colors.white,
                            size: 20.r,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // Verification Box Titles
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Final Verification",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryNavy,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Ensure all documents are current and clearly legible.",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textMuted,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Submit button
                    ElevatedButton(
                      onPressed: () {
                        if (!controller.hasAnySelection) {
                          Get.snackbar(
                            "Selection Required",
                            "Please select at least one qualification to submit.",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: const Color(0xFFEF4444), // red alert
                            colorText: Colors.white,
                            margin: EdgeInsets.all(16.w),
                            borderRadius: 8.r,
                          );
                          return;
                        }

                        // Success Dialog
                        Get.dialog(
                          Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.w),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 56.w,
                                    height: 56.w,
                                    decoration: const BoxDecoration(
                                      color: AppColors.secondaryGreen,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 32.r,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Submitted Successfully",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryNavy,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "Your qualifications have been submitted for verification. You will be notified once reviewed.",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.textMuted,
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 24.h),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back(); // close dialog
                                      Get.offAllNamed(AppRoute.verificationStatus); // go to verification status
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.secondaryGreen,
                                      foregroundColor: Colors.white,
                                      minimumSize: Size(double.infinity, 44.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      "Go to Dashboard",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          barrierDismissible: false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryGreen,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Submit for Verification",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
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

  Widget _buildCheckableCard({
    required String title,
    required String description,
    required IconData icon,
    required bool isChecked,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isChecked ? AppColors.secondaryGreen : const Color(0xFFE2E8F0),
            width: isChecked ? 1.8.w : 1.w,
          ),
          boxShadow: isChecked
              ? [
                  BoxShadow(
                    color: AppColors.secondaryGreen.withValues(alpha: 0.05),
                    blurRadius: 6.r,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            // Custom Checkbox
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: isChecked ? AppColors.secondaryGreen : Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: isChecked ? Colors.transparent : const Color(0xFFCBD5E1),
                  width: 1.5.w,
                ),
              ),
              alignment: Alignment.center,
              child: isChecked
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16.r,
                    )
                  : null,
            ),
            SizedBox(width: 16.w),

            // Card Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),

            // Faded Right Icon
            Icon(
              icon,
              color: isChecked ? AppColors.secondaryGreen.withValues(alpha: 0.6) : const Color(0xFF94A3B8),
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}

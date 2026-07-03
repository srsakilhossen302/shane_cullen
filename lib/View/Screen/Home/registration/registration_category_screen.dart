import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/registration_category_controller.dart';

class RegistrationCategoryScreen extends StatelessWidget {
  const RegistrationCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate or find the controller
    final controller = Get.put(RegistrationCategoryController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryGreen,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "REGISTRATION CATEGORY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Select from the nominated categories",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tournaments Category
            _buildCategoryTag("TOURNAMENTS"),
            SizedBox(height: 12.h),
            Obx(() => _buildOptionCard(
                  label: "Competitor",
                  isSelected: controller.isCompetitorSelected.value,
                  onTap: () => controller.toggleCompetitor(),
                )),
            Obx(() => _buildOptionCard(
                  label: "Match Official",
                  isSelected: controller.isMatchOfficialSelected.value,
                  onTap: () => controller.toggleMatchOfficial(),
                )),
            
            SizedBox(height: 20.h),
            
            // Camps Category
            _buildCategoryTag("CAMPS"),
            SizedBox(height: 12.h),
            Obx(() => _buildOptionCard(
                  label: "Participant",
                  isSelected: controller.isCampParticipantSelected.value,
                  onTap: () => controller.toggleCampParticipant(),
                )),
            
            SizedBox(height: 20.h),
            
            // Seminars Category
            _buildCategoryTag("SEMINARS"),
            SizedBox(height: 12.h),
            Obx(() => _buildOptionCard(
                  label: "Participant",
                  isSelected: controller.isSeminarParticipantSelected.value,
                  onTap: () => controller.toggleSeminarParticipant(),
                )),
            
            SizedBox(height: 36.h),
            
            // Register Now Bottom Button
            ElevatedButton(
              onPressed: () {
                // Future action hook
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryGreen,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register Now",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.chevron_right,
                    size: 16.r,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.secondaryGreen,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: AppColors.secondaryGreen,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            // Styled custom checkbox
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: AppColors.secondaryGreen,
                  width: 2.w,
                ),
                color: isSelected ? AppColors.secondaryGreen : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14.r,
                    )
                  : null,
            ),
            SizedBox(width: 16.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

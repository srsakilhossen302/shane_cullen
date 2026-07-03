import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/division_selection_controller.dart';
import '../../../../Core/AppRoute/app_route.dart';

class DivisionSelectionScreen extends StatelessWidget {
  const DivisionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DivisionSelectionController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Header
            Text(
              "Division Selection",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Select your competitive category and weight class",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textMuted,
              ),
            ),
            SizedBox(height: 20.h),

            // Section 1: Padded Contact Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Title
                  Row(
                    children: [
                      Icon(Icons.shield_outlined, color: AppColors.secondaryGreen, size: 20.r),
                      SizedBox(width: 8.w),
                      Text(
                        "Padded Contact",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryGreen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Age Group options list
                  Obx(() => _buildAgeGroupCard(
                        title: "8-9 Years",
                        subtitles: const ["LW", "MW", "HW"],
                        isSelected: controller.selectedAgeGroup.value == "8-9 Years",
                        onTap: () => controller.selectAgeGroup("8-9 Years"),
                      )),
                  SizedBox(height: 12.h),
                  Obx(() => _buildAgeGroupCard(
                        title: "10-12 Years",
                        isActiveText: "Active Selection",
                        isSelected: controller.selectedAgeGroup.value == "10-12 Years",
                        onTap: () => controller.selectAgeGroup("10-12 Years"),
                      )),
                  SizedBox(height: 12.h),
                  Obx(() => _buildAgeGroupCard(
                        title: "13-15 Years",
                        isSelected: controller.selectedAgeGroup.value == "13-15 Years",
                        onTap: () => controller.selectAgeGroup("13-15 Years"),
                      )),
                  
                  SizedBox(height: 20.h),

                  // Select Weight Division (Male)
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SELECT WEIGHT DIVISION (MALE)",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryGreen,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Obx(() => _buildWeightOptionButton(
                              title: "LIGHTWEIGHT",
                              subtitle: "Up to 70kg",
                              isSelected: controller.selectedWeightDivision.value == "LIGHTWEIGHT",
                              onTap: () => controller.selectWeightDivision("LIGHTWEIGHT"),
                            )),
                        SizedBox(height: 10.h),
                        Obx(() => _buildWeightOptionButton(
                              title: "MIDDLEWEIGHT",
                              subtitle: "70.1 - 80kg",
                              isSelected: controller.selectedWeightDivision.value == "MIDDLEWEIGHT",
                              onTap: () => controller.selectWeightDivision("MIDDLEWEIGHT"),
                            )),
                        SizedBox(height: 10.h),
                        Obx(() => _buildWeightOptionButton(
                              title: "HEAVYWEIGHT",
                              subtitle: "80.1kg +",
                              isSelected: controller.selectedWeightDivision.value == "HEAVYWEIGHT",
                              onTap: () => controller.selectWeightDivision("HEAVYWEIGHT"),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Section 2: Full Contact Green Banner
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.secondaryGreen,
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: const AssetImage("assets/images/martial_arts_sunset.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryGreen.withValues(alpha: 0.85),
                    BlendMode.srcATop,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.sports_kabaddi_outlined, color: Colors.white, size: 24.r),
                      SizedBox(width: 8.w),
                      Text(
                        "Full Contact",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      controller.toggleContactType();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.secondaryGreen,
                      elevation: 0,
                      minimumSize: Size(double.infinity, 45.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      "SWITCH TO FULL CONTACT",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Section 3: Kata Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.emoji_people_outlined, color: AppColors.secondaryGreen, size: 20.r),
                      SizedBox(width: 8.w),
                      Text(
                        "Kata",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryGreen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => _buildHorizontalOptionButton(
                              title: "IKO MATSUSHIMA",
                              isSelected: controller.selectedKata.value == "IKO MATSUSHIMA",
                              onTap: () => controller.selectKata("IKO MATSUSHIMA"),
                            )),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Obx(() => _buildHorizontalOptionButton(
                              title: "Other",
                              isSelected: controller.selectedKata.value == "Other",
                              onTap: () => controller.selectKata("Other"),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Section 4: Weapons Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.explore_outlined, color: AppColors.secondaryGreen, size: 20.r),
                      SizedBox(width: 8.w),
                      Text(
                        "Weapons",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryGreen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => _buildHorizontalOptionButton(
                              title: "TRADITIONAL",
                              isSelected: controller.selectedWeapons.value == "TRADITIONAL",
                              onTap: () => controller.selectWeapons("TRADITIONAL"),
                            )),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Obx(() => _buildHorizontalOptionButton(
                              title: "EXTREME",
                              isSelected: controller.selectedWeapons.value == "EXTREME",
                              onTap: () => controller.selectWeapons("EXTREME"),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Section 5: Weight Limit Regulations Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: Column(
                children: [
                  // Green Header
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "WEIGHT LIMIT REGULATIONS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.scale_outlined, color: Colors.white, size: 16.r),
                      ],
                    ),
                  ),
                  
                  // Table content
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Male Divisions
                        _buildRegulationHeader(Icons.male, "MALE DIVISIONS", const Color(0xFF2563EB)),
                        SizedBox(height: 12.h),
                        _buildRegulationRow("Lightweight", "Up to 70kg"),
                        const Divider(color: Color(0xFFF1F5F9), height: 1),
                        _buildRegulationRow("Middleweight", "70.1 - 80kg"),
                        const Divider(color: Color(0xFFF1F5F9), height: 1),
                        _buildRegulationRow("Heavyweight", "80.1kg +"),
                        
                        SizedBox(height: 16.h),
                        const Divider(color: Color(0xFFE2E8F0), thickness: 1),
                        SizedBox(height: 16.h),
                        
                        // Female Divisions
                        _buildRegulationHeader(Icons.female, "FEMALE DIVISIONS", const Color(0xFFDD6B20)),
                        SizedBox(height: 12.h),
                        _buildRegulationRow("Lightweight", "Up to 60kg"),
                        const Divider(color: Color(0xFFF1F5F9), height: 1),
                        _buildRegulationRow("Middleweight", "60.1 - 65kg"),
                        const Divider(color: Color(0xFFF1F5F9), height: 1),
                        _buildRegulationRow("Heavyweight", "65.1kg +"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () => _showSuccessDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryGreen,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "CONFIRM & REGISTER",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFDCFCE7),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  color: const Color(0xFF15803D),
                  size: 40.r,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Registration Success!",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryNavy,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Your details and division allocations have been saved successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.textMuted,
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  Get.close(1); // close dialog
                  Get.offAllNamed(AppRoute.home); // go to main screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryGreen,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 45.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Back to Home",
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
  }

  Widget _buildAgeGroupCard({
    required String title,
    List<String>? subtitles,
    String? isActiveText,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.secondaryGreen : const Color(0xFFE2E8F0),
            width: isSelected ? 2.w : 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Age Group",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.textMuted,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryGreen,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isSelected ? Icons.check_circle : Icons.info_outline,
                  color: isSelected ? AppColors.secondaryGreen : AppColors.textMuted,
                  size: 20.r,
                ),
              ],
            ),
            if (isActiveText != null && isSelected) ...[
              SizedBox(height: 6.h),
              Text(
                isActiveText,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.secondaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            if (subtitles != null && subtitles.isNotEmpty) ...[
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: subtitles
                    .map((sub) => Text(
                          sub,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMuted,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildWeightOptionButton({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? AppColors.secondaryGreen : Colors.transparent,
            width: 1.5.w,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryGreen,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalOptionButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
            width: 1.w,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.secondaryGreen : AppColors.textMuted,
          ),
        ),
      ),
    );
  }

  Widget _buildRegulationHeader(IconData icon, String title, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16.r),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildRegulationRow(String name, String limit) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.textMuted,
            ),
          ),
          Text(
            limit,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}

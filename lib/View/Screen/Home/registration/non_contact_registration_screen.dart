import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../model/event_model.dart';
import 'controller/non_contact_registration_controller.dart';

class NonContactRegistrationScreen extends StatelessWidget {
  const NonContactRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NonContactRegistrationController());
    final EventModel event = Get.arguments as EventModel;

    final List<String> ageDivisions = [
      "UNDER 6 YRS",
      "6 YRS – 7 YRS",
      "8 YRS – 9 YRS",
      "10YRS – 12 YRS",
      "13 YRS – 15 YRS",
      "16 YRS – 17 YRS",
      "NOVICE – UNGRADED – 9TH KYU",
      "INTERMEDIATE – 8TH KYU – 5TH KYU",
      "OPEN – 4TH KYU AND ABOVE",
      "SENIORS 35 YRS – 44YRS",
      "VETERANS 45 YRS – 54 YRS",
      "MASTERS 55 YRS +",
    ];

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Select DOJO Title
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Select ",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryGreen,
                          ),
                        ),
                        TextSpan(
                          text: "DOJO",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Configure your martial arts discipline and affiliate dojo for the upcoming ${event.title ?? "Oceania Championship"}.",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textMuted,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Dojo Information Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 10.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: AppColors.secondaryGreen, size: 20.r),
                            SizedBox(width: 8.w),
                            Text(
                              "Dojo Information",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryNavy,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "REGISTERED DOJO NAME",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMuted,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        
                        // Dropdown Selector
                        GestureDetector(
                          onTap: () => _openDojoSelector(context, controller),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Text(
                                      controller.selectedDojo.value.isEmpty
                                          ? "Enter your Dojo or Club name..."
                                          : controller.selectedDojo.value,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: controller.selectedDojo.value.isEmpty
                                            ? AppColors.textMuted
                                            : AppColors.primaryNavy,
                                      ),
                                    )),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.primaryNavy,
                                  size: 20.r,
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 12.h),
                        Text(
                          "Note: Ensure your dojo name matches your official federation registration.",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFFDD6B20),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 28.h),

                  // Non-Contact Divisions Header
                  Text(
                    "Non-Contact Divisions",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Select your age division for the technical non-contact categories.",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textMuted,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "AGE DIVISIONS (NON-CONTACT)",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMuted,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Division Selection List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ageDivisions.length,
                    separatorBuilder: (context, index) => SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      final division = ageDivisions[index];
                      return Obx(() {
                        final isSelected = controller.selectedAgeDivision.value == division;
                        return GestureDetector(
                          onTap: () => controller.selectAgeDivision(division),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isSelected ? AppColors.secondaryGreen : const Color(0xFFE2E8F0),
                                width: isSelected ? 1.5.w : 1.w,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    division,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      color: isSelected ? AppColors.secondaryGreen : AppColors.primaryNavy,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
                                      width: isSelected ? 6.w : 1.5.w,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Bottom sticky navigation bar
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10.r,
                  offset: Offset(0, -4.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back, size: 16.r),
                    label: Text(
                      "BACK",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.secondaryGreen,
                      side: BorderSide(color: AppColors.secondaryGreen, width: 1.5.w),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.selectedDojo.value.isEmpty) {
                        Get.snackbar(
                          "Dojo Required",
                          "Please select your dojo before continuing registration.",
                          backgroundColor: Colors.red.shade50,
                          colorText: Colors.red.shade900,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: EdgeInsets.all(16.r),
                        );
                      } else {
                        _showSuccessDialog(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryGreen,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CONTINUE REGISTRATION",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(Icons.arrow_forward, size: 16.r),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openDojoSelector(BuildContext context, NonContactRegistrationController controller) {
    Get.bottomSheet(
      Container(
        height: 400.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select your Dojo / Club",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: controller.dojos.length,
                itemBuilder: (context, index) {
                  final dojo = controller.dojos[index];
                  return ListTile(
                    title: Text(
                      dojo,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                    onTap: () {
                      controller.selectDojo(dojo);
                      Get.back();
                    },
                    trailing: Obx(() => controller.selectedDojo.value == dojo
                        ? Icon(Icons.check_circle, color: AppColors.secondaryGreen)
                        : const SizedBox.shrink()),
                  );
                },
              ),
            ),
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
}

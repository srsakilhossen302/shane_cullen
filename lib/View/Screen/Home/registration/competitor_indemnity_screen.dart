import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import 'controller/review_registration_controller.dart';
import 'review_registration_screen.dart'; // to share SignaturePainter if needed, or define locally

class CompetitorIndemnityScreen extends StatelessWidget {
  const CompetitorIndemnityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Find the existing ReviewRegistrationController
    final controller = Get.find<ReviewRegistrationController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        scrolledUnderElevation: 0.5,
        automaticallyImplyLeading: false,
        title: Text(
          "Competitor Indemnity",
          style: TextStyle(
            color: AppColors.primaryNavy,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: AppColors.primaryNavy, size: 24.r),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Green left-bordered banner
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 3.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryGreen.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              "Please read each point carefully and check the box to confirm your agreement.",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.textMuted,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Condition 1
                    Obx(() => _buildCheckItem(
                      text: "1. I do not suffer any physical injury or illness that would put me, other competitors, tournament officials, spectators, or any other person, at risk of being harmed, injured, placed in/or lead to a life threatening situation, by my participation in the tournament.",
                      value: controller.agreedTo1.value,
                      onChanged: (val) => controller.agreedTo1.value = val ?? false,
                    )),

                    // Condition 2
                    Obx(() => _buildCheckItem(
                      text: "2. I do not suffer any mental injury or illness that would place me, other competitors, tournament officials, or spectators, or any other person, at risk of being harmed, injured, placed in/or lead to a life threatening situation, by my participation in the tournament.",
                      value: controller.agreedTo2.value,
                      onChanged: (val) => controller.agreedTo2.value = val ?? false,
                    )),

                    // Condition 3
                    Obx(() => _buildCheckItem(
                      text: "3. I understand and voluntarily accept there is risk of harm (including, but not limited to, personal injury and illness, mental injury and illness, death, property damage, and economic loss) and I am responsible for my own actions and/or involvement, by my participation in the tournament.",
                      value: controller.agreedTo3.value,
                      onChanged: (val) => controller.agreedTo3.value = val ?? false,
                    )),

                    // Condition 4
                    Obx(() => _buildCheckItem(
                      text: "4. I voluntarily release and waive all liability towards the tournament governing organisation, organisers, competition officials, agents, employees, contractors, and volunteers, that may arise by my participation in the tournament.",
                      value: controller.agreedTo4.value,
                      onChanged: (val) => controller.agreedTo4.value = val ?? false,
                    )),

                    // Condition 5
                    Obx(() => _buildCheckItem(
                      text: "5. I understand the tournament governing organisation, organisers, competition officials, agents, employees, contractors, and volunteers, will not be liable for the cost of treatment of any physical injury or illness, mental injury or illness, or any other injury or illness whatsoever, that I may sustain by my participation in the tournament.",
                      value: controller.agreedTo5.value,
                      onChanged: (val) => controller.agreedTo5.value = val ?? false,
                    )),

                    // Condition 6
                    Obx(() => _buildCheckItem(
                      text: "6. I agree that I will become a member of the tournament governing body for this tournament only if I am not already a member.",
                      value: controller.agreedTo6.value,
                      onChanged: (val) => controller.agreedTo6.value = val ?? false,
                    )),

                    // Condition 7
                    Obx(() => _buildCheckItem(
                      text: "7. I agree to obey the rules of the tournament and all instructions, requests, and directions, from tournament organisers, competition officials, agents, employees, contractors, and volunteers, that may be given to me.",
                      value: controller.agreedTo7.value,
                      onChanged: (val) => controller.agreedTo7.value = val ?? false,
                    )),

                    // Condition 8
                    Obx(() => _buildCheckItem(
                      text: "8. I agree to the tournament organisers taking images of me by use of any recording device for my personal use, and organisation records, and consent that the images may be used, without fee or restriction, to promote the activities of the tournaments governing body.",
                      value: controller.agreedTo8.value,
                      onChanged: (val) => controller.agreedTo8.value = val ?? false,
                    )),

                    // Condition 9
                    Obx(() => _buildCheckItem(
                      text: "9. If I compete in full contact competition, I will submit to the tournament organisers prior to the registration closing date, a certificate not more than four (4) weeks old, from a registered and qualified medical practitioner, that I do not have a physical injury or illness or mental injury or illness, or any other injury or illness, that prevents me from participating, without restriction, in full contact competition.",
                      value: controller.agreedTo9.value,
                      onChanged: (val) => controller.agreedTo9.value = val ?? false,
                    )),

                    const Divider(color: Color(0xFFE2E8F0)),
                    SizedBox(height: 16.h),

                    // SIGNATURE Label
                    Text(
                      "SIGNATURE",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMuted,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Interactive Drawing Canvas
                    Container(
                      height: 130.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onPanStart: (details) {
                              controller.signaturePoints.add(details.localPosition);
                            },
                            onPanUpdate: (details) {
                              controller.signaturePoints.add(details.localPosition);
                            },
                            onPanEnd: (details) {
                              controller.signaturePoints.add(null);
                            },
                            child: Obx(() => CustomPaint(
                              painter: SignaturePainter(controller.signaturePoints.toList()),
                              size: Size.infinite,
                            )),
                          ),
                          Obx(() => controller.signaturePoints.isEmpty
                              ? const Center(
                                  child: Text(
                                    "Sign here",
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                )
                              : const SizedBox.shrink()),
                          Positioned(
                            bottom: 8.h,
                            right: 8.w,
                            child: SizedBox(
                              height: 28.h,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.grey.shade600,
                                  side: BorderSide(color: Colors.grey.shade300),
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                ),
                                onPressed: () => controller.clearSignature(),
                                child: Text("Clear", style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // DATE Label
                    Text(
                      "DATE",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMuted,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Obx(() => Text(
                            controller.signatureDate.value,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.primaryNavy,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                    SizedBox(height: 30.h),

                    // Print Agreement button
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.print, size: 16.r),
                      label: const Text("Print Agreement"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.secondaryGreen,
                        side: BorderSide(color: AppColors.secondaryGreen, width: 1.5.w),
                        minimumSize: Size(double.infinity, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Accept and Close button
                    Obx(() {
                      final isEnabled = controller.canAccept;
                      return ElevatedButton(
                        onPressed: isEnabled
                            ? () {
                                controller.signIndemnity();
                                Get.back();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isEnabled ? AppColors.secondaryGreen : Colors.grey.shade400,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey.shade400,
                          disabledForegroundColor: Colors.white70,
                          minimumSize: Size(double.infinity, 50.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          elevation: 0,
                        ),
                        child: const Text("Accept and Close"),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem({
    required String text,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.secondaryGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Core/AppRoute/app_route.dart';
import 'controller/match_officials_controller.dart';

class MatchOfficialsScreen extends StatelessWidget {
  const MatchOfficialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MatchOfficialsController());

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
              "MATCH OFFICIALS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please complete the form below to apply for a match official position.",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 11.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card 1: Basic Info (1. Grade, 2. Organisation, 3. Dojo)
              _buildSectionCard(
                children: [
                  // 1. Grade
                  _buildSectionTitle("1. Grade"),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () => _openGradeSelector(context, controller),
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
                                controller.selectedGrade.value.isEmpty
                                    ? "Select Grade"
                                    : controller.selectedGrade.value,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: controller.selectedGrade.value.isEmpty
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
                  SizedBox(height: 20.h),

                  // 2. Organisation
                  _buildSectionTitle("2. Organisation"),
                  SizedBox(height: 8.h),
                  Obx(() {
                    return Column(
                      children: [
                        _buildRadioOption("IKO Matsushima", controller.selectedOrganisation.value, (val) => controller.selectedOrganisation.value = val),
                        _buildRadioOption("WMAC", controller.selectedOrganisation.value, (val) => controller.selectedOrganisation.value = val),
                        _buildRadioOption("Other", controller.selectedOrganisation.value, (val) => controller.selectedOrganisation.value = val),
                      ],
                    );
                  }),
                  SizedBox(height: 20.h),

                  // 3. Dojo
                  _buildSectionTitle("3. Dojo"),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: controller.dojoNameController,
                    hintText: "Insert Dojo name",
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Card 2: 4. Accreditation
              _buildSectionCard(
                children: [
                  _buildSectionTitle("4. Accreditation"),
                  SizedBox(height: 12.h),
                  ...controller.acaccreditationListMapped(controller),
                  SizedBox(height: 20.h),

                  // Certificate No
                  _buildAccreditationSubTitle("① Certificate N°"),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: controller.certificateNoController,
                    hintText: "Insert Certificate N°",
                  ),
                  SizedBox(height: 16.h),

                  // Date Issued
                  _buildAccreditationSubTitle("② Date Issued"),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: controller.dateIssuedController,
                    hintText: "mm/dd/yyyy",
                  ),
                  SizedBox(height: 16.h),

                  // Upload Certificate
                  _buildAccreditationSubTitle("③ Upload Certificate"),
                  SizedBox(height: 8.h),
                  Obx(() {
                    final name = controller.uploadedCertificateName.value;
                    return CustomPaint(
                      painter: DottedBorderPainter(
                        color: name.isNotEmpty ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
                        radius: 10.r,
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.uploadedCertificateName.value = "official_accreditation_cert.pdf";
                        },
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                size: 32.r,
                                color: name.isNotEmpty ? AppColors.secondaryGreen : const Color(0xFF94A3B8),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                name.isNotEmpty ? name : "Tap to upload certificate",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: name.isNotEmpty ? AppColors.primaryNavy : AppColors.textMuted,
                                  fontWeight: name.isNotEmpty ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 8.h),
                  Text(
                    "Note: Match official certificates must be uploaded at time of application.",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.textMuted,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Card 3: Seminar (5, 6, 7)
              _buildSectionCard(
                children: [
                  _buildSectionTitle("5. Date of last Match Official Seminar"),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: controller.lastSeminarDateController,
                    hintText: "mm/dd/yyyy",
                  ),
                  SizedBox(height: 20.h),

                  _buildSectionTitle("6. Location of last Match Official Seminar"),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: controller.lastSeminarLocationController,
                    hintText: "City / Dojo",
                  ),
                  SizedBox(height: 20.h),

                  _buildSectionTitle("7. Seminar facilitated by"),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () => _openFacilitatorSelector(context, controller),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Text(
                                      controller.seminarFacilitatorType.value,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primaryNavy,
                                      ),
                                    )),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.primaryNavy,
                                  size: 18.r,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 3,
                        child: _buildTextField(
                          controller: controller.facilitatorNameController,
                          hintText: "Insert Name",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Card 4: Categories (8)
              _buildSectionCard(
                children: [
                  _buildSectionTitle("8. Tournament Categories I wish to be a Match Official"),
                  
                  _buildCategoryHeader("KATA"),
                  _buildCategoryCheckbox("IKO Matsushima Kyokushin", "kata_iko", controller),
                  _buildCategoryCheckbox("Non Matsushima Kyokushin", "kata_non_iko", controller),

                  _buildCategoryHeader("WEAPONS"),
                  _buildCategoryCheckbox("Traditional", "weapons_traditional", controller),
                  _buildCategoryCheckbox("Extreme", "weapons_extreme", controller),

                  _buildCategoryHeader("NON-CONTACT"),
                  _buildCategoryCheckbox("Judge", "non_contact_judge", controller),
                  _buildCategoryCheckbox("Referee", "non_contact_referee", controller),

                  _buildCategoryHeader("PADDED CONTACT"),
                  _buildCategoryCheckbox("Judge", "padded_contact_judge", controller),
                  _buildCategoryCheckbox("Referee", "padded_contact_referee", controller),

                  _buildCategoryHeader("COLTS"),
                  _buildCategoryCheckbox("Judge", "colts_judge", controller),
                  _buildCategoryCheckbox("Referee", "colts_referee", controller),

                  _buildCategoryHeader("FULL CONTACT"),
                  _buildCategoryCheckbox("Judge", "full_contact_judge", controller),
                  _buildCategoryCheckbox("Referee", "full_contact_referee", controller),

                  _buildCategoryHeader("RING KARATE"),
                  _buildCategoryCheckbox("Judge", "ring_karate_judge", controller),
                  _buildCategoryCheckbox("Referee", "ring_karate_referee", controller),
                ],
              ),
              SizedBox(height: 16.h),

              // Card 5: Terms (9)
              _buildSectionCard(
                children: [
                  Text(
                    "9. Your application to officiate in the capacity you have nominated does not guarantee you will be selected to officiate in that capacity or in any other capacity at the tournament.",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primaryNavy,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Your application will be determined by the tournament organizers at their sole discretion based on factors that includes, but not limited to, the following:",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primaryNavy,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildBulletPoint("Number of applications submitted"),
                  _buildBulletPoint("Accreditation"),
                  _buildBulletPoint("Experience"),
                ],
              ),
              SizedBox(height: 16.h),

              // Card 6: Indemnity (10)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2), // Light Red/Pink
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xFFFCA5A5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.warning_amber_rounded, color: const Color(0xFFEF4444), size: 20.r),
                        SizedBox(width: 8.w),
                        Text(
                          "10. Indemnity",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFB91C1C),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Indemnity Required",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFB91C1C),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "You must read and sign the indemnity agreement before proceeding with your registration.",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF991B1B),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Obx(() {
                      final isSigned = controller.isIndemnitySigned.value;
                      return InkWell(
                        onTap: () => Get.toNamed(AppRoute.competitorIndemnity),
                        child: Text(
                          isSigned ? "Indemnity Signed ✓" : "Open Indemnity Agreement",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: isSigned ? AppColors.secondaryGreen : const Color(0xFFB91C1C),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 32.h),

              // Register Button
              OutlinedButton(
                onPressed: () {
                  if (!controller.isIndemnitySigned.value) {
                    Get.snackbar(
                      "Indemnity Required",
                      "Please open and accept the Indemnity Agreement first.",
                      backgroundColor: Colors.red.shade50,
                      colorText: Colors.red.shade900,
                      snackPosition: SnackPosition.BOTTOM,
                      margin: EdgeInsets.all(16.r),
                    );
                  } else {
                    Get.dialog(
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        title: const Text("Success"),
                        content: const Text("Your Match Officials application has been registered successfully!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.close(2); // Close dialog & go back to home screen
                              Get.offAllNamed(AppRoute.home);
                            },
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.secondaryGreen,
                  side: BorderSide(color: AppColors.secondaryGreen, width: 2.w),
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: Text(
                  "REGISTER NOW",
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
      ),
    );
  }

  // Helper widgets
  Widget _buildSectionCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryNavy,
      ),
    );
  }

  Widget _buildAccreditationSubTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryNavy,
      ),
    );
  }

  Widget _buildRadioOption(String label, String groupValue, ValueChanged<String> onChanged) {
    final isSelected = label == groupValue;
    return InkWell(
      onTap: () => onChanged(label),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 18.w,
              height: 18.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
                  width: 1.5.w,
                ),
              ),
              padding: EdgeInsets.all(3.r),
              child: isSelected
                  ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryGreen,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 10.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? AppColors.primaryNavy : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.primaryNavy,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.textMuted,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.secondaryGreen, width: 1.5),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textMuted,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildCategoryCheckbox(String label, String key, MatchOfficialsController controller) {
    return Obx(() {
      final isSelected = controller.selectedCategories.contains(key);
      return GestureDetector(
        onTap: () => controller.toggleCategory(key),
        child: Container(
          margin: EdgeInsets.only(bottom: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isSelected ? AppColors.secondaryGreen : const Color(0xFFE2E8F0),
              width: isSelected ? 1.5.w : 1.w,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: isSelected ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
                    width: 1.5.w,
                  ),
                  color: isSelected ? AppColors.secondaryGreen : Colors.transparent,
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12.r,
                      )
                    : null,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: isSelected ? AppColors.primaryNavy : Colors.black87,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 14.sp, color: AppColors.textMuted)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.primaryNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openGradeSelector(BuildContext context, MatchOfficialsController controller) {
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
              "Select Grade",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: controller.grades.length,
                itemBuilder: (context, index) {
                  final grade = controller.grades[index];
                  return ListTile(
                    title: Text(
                      grade,
                      style: TextStyle(fontSize: 14.sp, color: AppColors.primaryNavy),
                    ),
                    onTap: () {
                      controller.selectedGrade.value = grade;
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openFacilitatorSelector(BuildContext context, MatchOfficialsController controller) {
    Get.bottomSheet(
      Container(
        height: 250.h,
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
              "Select Facilitator Type",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: controller.facilitatorTypes.length,
                itemBuilder: (context, index) {
                  final type = controller.facilitatorTypes[index];
                  return ListTile(
                    title: Text(
                      type,
                      style: TextStyle(fontSize: 14.sp, color: AppColors.primaryNavy),
                    ),
                    onTap: () {
                      controller.seminarFacilitatorType.value = type;
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extracted accreditationList helper to keep file code clean
extension _MatchOfficialsAccreditationList on MatchOfficialsController {
  List<Widget> acaccreditationListMapped(MatchOfficialsController controller) {
    return accreditationList.map((title) {
      return Obx(() {
        final isSelected = controller.selectedAccreditations.contains(title);
        return GestureDetector(
          onTap: () => controller.toggleAccreditation(title),
          child: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isSelected ? AppColors.secondaryGreen : const Color(0xFFE2E8F0),
                width: isSelected ? 1.5.w : 1.w,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 18.w,
                  height: 18.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      color: isSelected ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
                      width: 1.5.w,
                    ),
                    color: isSelected ? AppColors.secondaryGreen : Colors.transparent,
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12.r,
                        )
                      : null,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: isSelected ? AppColors.primaryNavy : Colors.black87,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }).toList();
  }
}

// Dotted border painter for upload area
class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dash;
  final double radius;

  DottedBorderPainter({
    this.color = const Color(0xFFCBD5E1),
    this.strokeWidth = 1.5,
    this.gap = 4.0,
    this.dash = 6.0,
    this.radius = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ));

    final dashPath = Path();
    double distance = 0.0;
    for (final pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dash),
          Offset.zero,
        );
        distance += dash + gap;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

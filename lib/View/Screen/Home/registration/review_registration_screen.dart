import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Core/AppRoute/app_route.dart';
import 'controller/review_registration_controller.dart';

class ReviewRegistrationScreen extends StatelessWidget {
  const ReviewRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewRegistrationController());
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
        title: Text(
          "Review Registration",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
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
                  // Section: Registration Details Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "REGISTRATION DETAILS",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryGreen,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        const Divider(color: Color(0xFFE2E8F0), thickness: 1),
                        SizedBox(height: 12.h),

                        // Name
                        _buildDetailItem("Name", "Elite Athlete", isGreenValue: true),
                        SizedBox(height: 16.h),

                        // Grid items
                        Row(
                          children: [
                            Expanded(child: _buildDetailItem("DOB", "15/05/1995")),
                            Expanded(child: _buildDetailItem("Gender", "Male")),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        Row(
                          children: [
                            Expanded(child: _buildDetailItem("Dojo", "MKA Dojo")),
                            Expanded(child: _buildDetailItem("Tournament Role", "Competitor")),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        Row(
                          children: [
                            Expanded(child: _buildDetailItem("Camp Status", "Participant")),
                            Expanded(child: _buildDetailItem("Division", "Full Contact Elite")),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildDetailItem("Weight Class", "Middleweight (70.1kg - 80kg)")),
                            Expanded(child: _buildDetailItem("Current Rank", "1st Dan (Shodan)")),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        const Divider(color: Color(0xFFE2E8F0), thickness: 1),
                        SizedBox(height: 12.h),

                        // Edit Details button
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                            onPressed: () => Get.back(),
                            icon: Icon(Icons.edit, size: 14.r, color: AppColors.secondaryGreen),
                            label: Text(
                              "EDIT DETAILS",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryGreen,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFF1F5F9),
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Section: Division & Weight Card
                  Container(
                    width: double.infinity,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DIVISION & WEIGHT",
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryGreen,
                                letterSpacing: 0.5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Row(
                                children: [
                                  Icon(Icons.edit, size: 12.r, color: AppColors.secondaryGreen),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.secondaryGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        _buildDetailItem("Division", "Full Contact Elite"),
                        SizedBox(height: 12.h),
                        _buildDetailItem("Weight Class", "Middleweight (70.1kg - 80kg)"),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Section: Fees Summary Card
                  Text(
                    "FEES SUMMARY",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
                    ),
                    child: Column(
                      children: [
                        _buildFeeRow("Base Registration", "\$80.00"),
                        SizedBox(height: 10.h),
                        _buildFeeRow("Full Contact Division", "\$50.00"),
                        SizedBox(height: 10.h),
                        _buildFeeRow("Kata Performance", "\$45.00"),
                        const Divider(color: Color(0xFFE2E8F0), height: 32, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryGreen,
                              ),
                            ),
                            Text(
                              "\$175.00 AUD",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryNavy,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Section: Competitor Indemnity Card
                  Text(
                    "COMPETITOR INDEMNITY",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Obx(() {
                    final isSigned = controller.isIndemnitySigned.value;
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: isSigned ? const Color(0xFFECFDF5) : const Color(0xFFFEF2F2), // Soft Green or Soft Red
                        border: Border.all(
                          color: isSigned ? const Color(0xFFA7F3D0) : const Color(0xFFFEE2E2),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                isSigned ? Icons.check_circle : Icons.report_problem,
                                color: isSigned ? const Color(0xFF10B981) : const Color(0xFFEF4444),
                                size: 20.r,
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      isSigned ? "Indemnity Agreement Accepted" : "Indemnity Agreement Required",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: isSigned ? const Color(0xFF065F46) : const Color(0xFF991B1B),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      isSigned
                                          ? "Thank you. You have successfully signed and agreed to the competitor indemnity terms."
                                          : "All competitors must review and sign the indemnity agreement before proceeding to payment.",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: isSigned ? const Color(0xFF047857) : const Color(0xFFB91C1C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          
                          // Document selection button
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoute.competitorIndemnity),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: isSigned ? AppColors.secondaryGreen : const Color(0xFFCBD5E1),
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isSigned ? Icons.check_circle_outline : Icons.edit_note,
                                    color: AppColors.secondaryGreen,
                                    size: 18.r,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    isSigned ? "Review Indemnity Agreement" : "Open Competitor Indemnity Agreement",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.secondaryGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),

          // Bottom Proceed to Payment button
          Obx(() {
            final isSigned = controller.isIndemnitySigned.value;
            return Container(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (!isSigned) {
                    Get.snackbar(
                      "Indemnity Required",
                      "Please open and accept the Competitor Indemnity Agreement first.",
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
                  backgroundColor: isSigned ? AppColors.secondaryGreen : Colors.grey.shade400,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "PROCEED TO PAYMENT",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, {bool isGreenValue = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: isGreenValue ? AppColors.secondaryGreen : AppColors.primaryNavy,
          ),
        ),
      ],
    );
  }

  Widget _buildFeeRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.secondaryGreen,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.secondaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
                "Your registration and payment have been processed successfully.",
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

class SignaturePainter extends CustomPainter {
  final List<Offset?> points;

  SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryNavy
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) => true;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../model/event_model.dart';
import 'controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    
    // Retrieve EventModel passed as argument (if any)
    final EventModel? event = Get.arguments as EventModel?;
    final String tournamentName = event?.title ?? "National Championship 2026";
    final String feeText = event?.fee ?? "AUD 2000";

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
              "Payment",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Complete your payment",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tournament details card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.w),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tournament",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    tournamentName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const Divider(color: Color(0xFFE2E8F0), thickness: 1),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Registration Fee",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        feeText.contains("AUD") ? feeText : "AUD $feeText",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Select Payment Method section
            Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
            SizedBox(height: 10.h),
            
            // Payment method card option
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.secondaryGreen, width: 1.5.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  // Radio dot indicator
                  Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryNavy,
                      border: Border.all(color: AppColors.primaryNavy, width: 1.w),
                    ),
                    child: Center(
                      child: Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Icon(
                    Icons.credit_card,
                    color: AppColors.secondaryGreen,
                    size: 20.r,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Credit / Debit Card",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Form inputs
            _buildInputLabel("Card Number"),
            _buildTextField(
              hint: "1234 5678 9012 3456",
              keyboardType: TextInputType.number,
              onChanged: (val) => controller.cardNumber.value = val,
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("Expiry Date"),
                      _buildTextField(
                        hint: "MM/YY",
                        keyboardType: TextInputType.datetime,
                        onChanged: (val) => controller.expiryDate.value = val,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("CVV"),
                      _buildTextField(
                        hint: "123",
                        keyboardType: TextInputType.number,
                        onChanged: (val) => controller.cvv.value = val,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            _buildInputLabel("Cardholder Name"),
            _buildTextField(
              hint: "Name on card",
              keyboardType: TextInputType.name,
              onChanged: (val) => controller.cardHolderName.value = val,
            ),
            SizedBox(height: 32.h),

            // Pay Button
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoute.paymentSuccess, arguments: event),
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
                "Pay ${feeText.contains("AUD") ? feeText : "AUD $feeText"}",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Secure note footer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: AppColors.textMuted,
                  size: 16.r,
                ),
                SizedBox(width: 6.w),
                Text(
                  "Secure payment powered by SSL encryption",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryNavy,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextInputType keyboardType,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        ),
        style: TextStyle(fontSize: 14.sp, color: AppColors.primaryNavy),
      ),
    );
  }
}

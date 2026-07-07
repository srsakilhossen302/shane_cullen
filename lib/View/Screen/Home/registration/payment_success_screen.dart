import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../model/event_model.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve EventModel passed as argument (if any)
    final EventModel? event = Get.arguments as EventModel?;
    final String tournamentName = event?.title ?? "National Championship 2026";
    final String feeText = event?.fee ?? "AUD 2000";

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Centered Green Check Icon
              Container(
                width: 100.w,
                height: 100.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFDCFCE7),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_outline,
                  color: const Color(0xFF10B981),
                  size: 60.r,
                ),
              ),
              SizedBox(height: 24.h),

              // Title and Subtitle
              Text(
                "Payment Successful!",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryNavy,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Your registration is confirmed",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textMuted,
                ),
              ),
              SizedBox(height: 32.h),

              // Transaction Details Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    // Top transaction ID block
                    Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        children: [
                          Text(
                            "Transaction ID",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "TXN202604168872",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryNavy,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Color(0xFFE2E8F0), height: 1),
                    
                    // Middle detail items
                    Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        children: [
                          _buildDetailRow("Tournament", tournamentName),
                          SizedBox(height: 12.h),
                          _buildDetailRow("Category", "Lightweight (-70kg)"),
                          SizedBox(height: 12.h),
                          _buildDetailRow(
                            "Amount Paid",
                            feeText.contains("AUD") ? feeText : "AUD $feeText",
                            isGreenValue: true,
                          ),
                          SizedBox(height: 12.h),
                          _buildDetailRow("Date & Time", "April 16, 2026, 2:30 PM"),
                        ],
                      ),
                    ),
                    
                    // Bottom note section
                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF), // Soft Blue
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "✅",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              "Registration confirmed! Check your email for tournament details and bracket information.",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF1E3A8A), // Dark blue text
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),

              // Action Button: View My Tournaments
              ElevatedButton(
                onPressed: () => Get.toNamed(AppRoute.matchOfficials),
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
                  "View My Tournaments",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Action TextButton: Download Receipt
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.download, size: 18.r, color: Colors.black87),
                label: Text(
                  "Download Receipt",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isGreenValue = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: isGreenValue ? AppColors.secondaryGreen : AppColors.primaryNavy,
            ),
          ),
        ),
      ],
    );
  }
}

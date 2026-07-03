import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../model/event_model.dart';
import 'controller/athlete_credentials_controller.dart';

class AthleteCredentialsScreen extends StatelessWidget {
  const AthleteCredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve passed EventModel argument
    final EventModel event = Get.arguments as EventModel;
    final controller = Get.put(AthleteCredentialsController());

    // Generate dynamic region/country label
    String regionText = "OCEANIA REGION";
    if (event.location != null && event.location!.contains(",")) {
      final parts = event.location!.split(",");
      final country = parts.last.trim();
      regionText = "${country.toUpperCase()} REGION";
    }

    // List of 23 ranks as shown in user's image
    final List<Map<String, String>> ranksList = [
      {"name": "UNGRADED", "subtitle": ""},
      {"name": "12TH KYU (CHILDREN ONLY)", "subtitle": "CHILDREN ONLY"},
      {"name": "11TH KYU (CHILDREN ONLY)", "subtitle": "CHILDREN ONLY"},
      {"name": "10TH KYU", "subtitle": ""},
      {"name": "9TH KYU", "subtitle": ""},
      {"name": "8TH KYU", "subtitle": ""},
      {"name": "7TH KYU", "subtitle": ""},
      {"name": "6TH KYU", "subtitle": ""},
      {"name": "5TH KYU", "subtitle": ""},
      {"name": "4TH KYU", "subtitle": ""},
      {"name": "3RD KYU", "subtitle": ""},
      {"name": "2ND KYU", "subtitle": ""},
      {"name": "1ST KYU", "subtitle": ""},
      {"name": "SHODAN", "subtitle": ""},
      {"name": "NIDAN", "subtitle": ""},
      {"name": "SANDAN", "subtitle": ""},
      {"name": "YONDAN", "subtitle": ""},
      {"name": "GODAN", "subtitle": ""},
      {"name": "ROKU DAN", "subtitle": ""},
      {"name": "SHICHIDAN", "subtitle": ""},
      {"name": "HANCHIDAN", "subtitle": ""},
      {"name": "KYUDAN", "subtitle": ""},
      {"name": "JUDAN", "subtitle": ""},
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            // Event Summary Banner
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 15.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Banner Cover Image
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        child: Image.asset(
                          event.imageUrl ?? "assets/images/martial_arts_sunset.png",
                          width: double.infinity,
                          height: 180.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      
                      // Dark Overlay for text legibility
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withValues(alpha: 0.6),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      
                      // Region badge on image
                      Positioned(
                        bottom: 40.h,
                        left: 16.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryGreen,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            regionText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      
                      // Title
                      Positioned(
                        bottom: 12.h,
                        left: 16.w,
                        right: 16.w,
                        child: Text(
                          event.title ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 16.h),
            
            // Event Details Card
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
                  Text(
                    "Event Details",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryGreen,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  
                  // Date & Time Row
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, color: AppColors.secondaryGreen, size: 20.r),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DATE & TIME",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Text(
                            event.date ?? "",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // Venue Row
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: AppColors.secondaryGreen, size: 20.r),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "VENUE",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Text(
                            event.location ?? "",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 16.h),
            
            // Athlete Credentials Form
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
                  Text(
                    "Athlete Credentials",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryGreen,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Please provide your precise physical and rank details for division bracket generation.",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textMuted,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  
                  // Weight Field
                  _buildInputLabel(Icons.unfold_more, "WEIGHT (KILOGRAMS)"),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    hintText: "00.00",
                    suffix: "KG",
                    onChanged: (val) => controller.weight.value = val,
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // Height Field
                  _buildInputLabel(Icons.height, "HEIGHT FIELD"),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    hintText: "000",
                    suffix: "CM",
                    onChanged: (val) => controller.height.value = val,
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // Rank / Grade field dropdown
                  _buildInputLabel(Icons.emoji_events_outlined, "RANK / GRADE (BELT LEVEL)"),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () => _openRankBottomSheet(context, ranksList, controller),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFCBD5E1), width: 1.w),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text(
                                controller.selectedRank.value.isEmpty
                                    ? "Select Belt Level"
                                    : controller.selectedRank.value,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: controller.selectedRank.value.isEmpty
                                      ? AppColors.textMuted
                                      : AppColors.primaryNavy,
                                ),
                              )),
                          Icon(Icons.keyboard_arrow_down, color: AppColors.primaryNavy, size: 24.r),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20.h),
                  
                  // Division Allocation banner
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGreen,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: Colors.white, size: 20.r),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DIVISION ALLOCATION",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Weight and Grade inputs will automatically assign your division. This cannot be changed after registration closes.",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.white.withValues(alpha: 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Confirm Registration Button
                  ElevatedButton(
                    onPressed: () {},
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
                      "CONFIRM REGISTRATION",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 12.h),
                  
                  // Save Progress Button
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.secondaryGreen,
                      side: BorderSide(color: AppColors.secondaryGreen, width: 1.w),
                      minimumSize: Size(double.infinity, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "SAVE PROGRESS",
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
    );
  }

  Widget _buildInputLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: AppColors.secondaryGreen, size: 14.r),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryGreen,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String hintText,
    required String suffix,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFCBD5E1), width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14.sp),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              ),
              style: TextStyle(fontSize: 14.sp, color: AppColors.primaryNavy),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Text(
              suffix,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Opens a custom bottom sheet with the dark rank list theme
  void _openRankBottomSheet(
    BuildContext context,
    List<Map<String, String>> ranksList,
    AthleteCredentialsController controller,
  ) {
    Get.bottomSheet(
      Container(
        height: 600.h,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E), // Dark background matching the image
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bottom sheet Title
            Text(
              "RANK / GRADE (BELT LEVEL)",
              style: TextStyle(
                color: const Color(0xFF8A8A8F),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            
            // Scrollable list of options
            Expanded(
              child: ListView.builder(
                itemCount: ranksList.length,
                itemBuilder: (context, index) {
                  final rank = ranksList[index];
                  final name = rank["name"]!;
                  final subtitle = rank["subtitle"]!;
                  
                  final isSelected = controller.selectedRank.value == name;
                  
                  return GestureDetector(
                    onTap: () {
                      controller.selectRank(name);
                      Get.back(); // close bottom sheet
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? const Color(0xFF72B06B) : const Color(0xFF444446),
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: const Color(0xFF86EFAC), // Bright green text
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (subtitle.isNotEmpty) ...[
                            SizedBox(height: 2.h),
                            Text(
                              subtitle,
                              style: TextStyle(
                                color: Colors.blue.shade400,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';
import 'controller/home_controller.dart';
import 'model/event_model.dart';
import '../../../Core/AppRoute/app_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Soft premium grey background
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Green Header Block
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(24.w, 48.h, 24.w, 24.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tournaments & Camps",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Join. Compete. Conquer.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  
                  // Search Bar Input
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 10.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (val) => controller.searchQuery.value = val,
                      decoration: InputDecoration(
                        hintText: "Search tournaments or locations...",
                        hintStyle: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.textMuted,
                          size: 20.r,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      ),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20.h),
            
            // Category Selectors Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Obx(() => Row(
                children: [
                  Expanded(
                    child: _buildCategoryButton(
                      label: "Tournaments",
                      isSelected: controller.selectedCategory.value == "Tournaments",
                      onTap: () => controller.selectCategory("Tournaments"),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _buildCategoryButton(
                      label: "Camps",
                      isSelected: controller.selectedCategory.value == "Camps",
                      onTap: () => controller.selectCategory("Camps"),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _buildCategoryButton(
                      label: "Seminars",
                      isSelected: controller.selectedCategory.value == "Seminars",
                      onTap: () => controller.selectCategory("Seminars"),
                    ),
                  ),
                ],
              )),
            ),
            
            Obx(() {
              final featured = controller.featuredEvent;
              if (featured == null) return const SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  
                  // Featured Event Title Row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF97316), // Orange star circle
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16.r,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Featured Event",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // Featured Event Details Card
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoute.eventDetails, arguments: featured),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Container(
                        width: double.infinity,
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
                            // Featured Banner Image
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    topRight: Radius.circular(16.r),
                                  ),
                                  child: featured.imageUrl != null && featured.imageUrl!.isNotEmpty
                                      ? Image.asset(
                                          featured.imageUrl!,
                                          width: double.infinity,
                                          height: 200.h,
                                          fit: BoxFit.cover,
                                        )
                                      : SizedBox(
                                          width: double.infinity,
                                          height: 200.h,
                                          child: const Icon(Icons.image),
                                        ),
                                ),
                                
                                // Dark Gradient Overlay at the bottom
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
                                
                                // "Featured" Tag
                                Positioned(
                                  top: 12.h,
                                  right: 12.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF59E0B), // Golden badge
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.star, color: AppColors.primaryNavy, size: 12.r),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "Featured",
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryNavy,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                                // Overlaid Title & Details on Image
                                Positioned(
                                  bottom: 12.h,
                                  left: 16.w,
                                  right: 16.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        featured.title ?? "",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          if (featured.date != null)
                                            _buildImageBadge(Icons.calendar_today, featured.date!),
                                          if (featured.date != null && featured.location != null)
                                            SizedBox(width: 8.w),
                                          if (featured.location != null)
                                            _buildImageBadge(Icons.location_on, featured.location!),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            
                            // Register Now Action Button
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              child: ElevatedButton(
                                onPressed: () => Get.toNamed(AppRoute.eventDetails, arguments: featured),
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
                                    Icon(Icons.arrow_forward, size: 16.r),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            
            SizedBox(height: 24.h),
            
            // All Events Section (Header & List)
            Obx(() {
              final filtered = controller.filteredEvents;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // All Events Header & Badge Row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Events",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            "${filtered.length} found",
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // List of All Events
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: filtered.isEmpty
                        ? Container(
                            height: 150.h,
                            alignment: Alignment.center,
                            child: Text(
                              "No events found",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textMuted,
                              ),
                            ),
                          )
                        : Column(
                            children: filtered.map((event) => _buildEventItem(event)).toList(),
                          ),
                  ),
                ],
              );
            }),
            
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xFFE2E8F0),
            width: 1.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.textMuted,
          ),
        ),
      ),
    );
  }

  Widget _buildImageBadge(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 10.r),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(EventModel event) {
    final imageUrl = event.imageUrl ?? "";
    final title = event.title ?? "";
    final date = event.date ?? "";
    final location = event.location ?? "";
    final fee = event.fee ?? "";
    final prize = event.prize ?? "";
    final isOpen = event.isOpen ?? false;

    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.eventDetails, arguments: event),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          children: [
            // Event Thumbnail Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: imageUrl.isNotEmpty
                  ? Image.asset(
                      imageUrl,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 80.w,
                      height: 80.w,
                      child: const Icon(Icons.image),
                    ),
            ),
            SizedBox(width: 16.w),
            
            // Event Details Block
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isOpen)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            "Open",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF15803D),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.blue.shade600, size: 12.r),
                      SizedBox(width: 6.w),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue.shade600, size: 12.r),
                      SizedBox(width: 6.w),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: const Color(0xFFF1F5F9),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fee",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Text(
                            fee,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2563EB),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 24.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Prize",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Text(
                            prize,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFD97706),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(width: 4.w),
            Icon(
              Icons.chevron_right,
              color: AppColors.textMuted.withValues(alpha: 0.6),
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}

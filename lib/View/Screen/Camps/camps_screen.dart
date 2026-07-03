import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../Home/controller/home_controller.dart';
import '../Home/model/event_model.dart';

class CampsScreen extends StatelessWidget {
  const CampsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Camps",
          style: TextStyle(
            color: AppColors.primaryNavy,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: TextField(
                onChanged: (val) => homeController.searchQuery.value = val,
                decoration: InputDecoration(
                  hintText: "Search camps...",
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryNavy,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        final camps = homeController.events.where((event) {
          final isCamp = event.category == 'Camps';
          final query = homeController.searchQuery.value.toLowerCase().trim();
          final matchesSearch = query.isEmpty ||
              (event.title?.toLowerCase().contains(query) ?? false) ||
              (event.location?.toLowerCase().contains(query) ?? false);
          return isCamp && matchesSearch;
        }).toList();

        if (camps.isEmpty) {
          return Center(
            child: Text(
              "No camps found",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textMuted,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(24.r),
          itemCount: camps.length,
          itemBuilder: (context, index) {
            final event = camps[index];
            return _buildCampItem(event);
          },
        );
      }),
    );
  }

  Widget _buildCampItem(EventModel event) {
    final imageUrl = event.imageUrl ?? "";
    final title = event.title ?? "";
    final date = event.date ?? "";
    final location = event.location ?? "";
    final fee = event.fee ?? "";
    final prize = event.prize ?? "";
    final isOpen = event.isOpen ?? false;

    return Container(
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
    );
  }
}

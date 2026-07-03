import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          )),
      bottomNavigationBar: Obx(() => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: const Color(0xFFE2E8F0),
                  width: 1.h,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home,
                    label: "Home",
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: Icons.calendar_today_outlined,
                    activeIcon: Icons.calendar_today,
                    label: "Tournaments",
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: Icons.emoji_events_outlined,
                    activeIcon: Icons.emoji_events,
                    label: "Results",
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 3,
                    icon: Icons.adjust_outlined, // Concentric circle target icon
                    activeIcon: Icons.adjust,
                    label: "Camps",
                    controller: controller,
                  ),
                  _buildNavItem(
                    index: 4,
                    icon: Icons.person_outline,
                    activeIcon: Icons.person,
                    label: "Profile",
                    controller: controller,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required DashboardController controller,
  }) {
    final isSelected = controller.currentIndex.value == index;
    final color = isSelected ? Colors.black : const Color(0xFF94A3B8);

    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: color,
              size: 24.r,
            ),
            SizedBox(height: 6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Core/AppRoute/app_route.dart';
import '../Dashboard/controller/dashboard_controller.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final selectedTab = "Dashboard".obs;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // 1. Green Header Banner
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 24.h),
            decoration: const BoxDecoration(
              color: AppColors.secondaryGreen,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circular avatar with camera icon overlay
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=200",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryGreen,
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 14.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
                // Name and Badges
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() => Text(
                            controller.fullName.value,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          // Belt Badge
                          Obx(() => Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD97706), // Orange
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  controller.belt.value,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          SizedBox(width: 8.w),
                          // 5 years Badge
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                            ),
                            child: Text(
                              "5 years",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. Main Content Scroll View
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tab Selector: Dashboard / Info
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF1F5),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            final isSelected = selectedTab.value == "Dashboard";
                            return GestureDetector(
                              onTap: () => selectedTab.value = "Dashboard",
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withValues(alpha: 0.05),
                                            blurRadius: 4.r,
                                            offset: Offset(0, 2.h),
                                          )
                                        ]
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    "Dashboard",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                      color: isSelected ? Colors.black87 : const Color(0xFF64748B),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        Expanded(
                          child: Obx(() {
                            final isSelected = selectedTab.value == "Info";
                            return GestureDetector(
                              onTap: () => selectedTab.value = "Info",
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withValues(alpha: 0.05),
                                            blurRadius: 4.r,
                                            offset: Offset(0, 2.h),
                                          )
                                        ]
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    "Info",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                      color: isSelected ? Colors.black87 : const Color(0xFF64748B),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Conditional body view based on selected tab
                  Obx(() {
                    if (selectedTab.value == "Dashboard") {
                      return _buildDashboardContent();
                    } else {
                      return controller.isEditing.value
                          ? _buildEditContent(context, controller)
                          : _buildInfoContent(controller);
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dashboard Tab Content
  Widget _buildDashboardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Add a Children" Banner Button
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.competitionHistory);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.secondaryGreen,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondaryGreen.withValues(alpha: 0.2),
                  blurRadius: 8.r,
                  offset: Offset(0, 4.h),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add a Children",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24.r,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),

        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.tournamentPerformance);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.01),
                  blurRadius: 10.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7), // Light green
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.emoji_events_outlined,
                    color: AppColors.secondaryGreen,
                    size: 24.r,
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryNavy,
                      ),
                    ),
                    Text(
                      "Tournaments",
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
        ),
        SizedBox(height: 20.h),

        // Quick Actions Grid Container
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryNavy,
                ),
              ),
              SizedBox(height: 16.h),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1.25,
                children: [
                  _buildQuickActionCard(
                    label: "Join Tournament",
                    icon: Icons.emoji_events_outlined,
                    backgroundColor: const Color(0xFFEFF6FF), // Light blue
                    iconColor: const Color(0xFF3B82F6),
                    onTap: () {
                      if (Get.isRegistered<DashboardController>()) {
                        Get.find<DashboardController>().currentIndex.value = 1;
                      }
                    },
                  ),
                  _buildQuickActionCard(
                    label: "My Brackets",
                    icon: Icons.bar_chart_outlined,
                    backgroundColor: const Color(0xFFF0FDF4), // Light green
                    iconColor: const Color(0xFF22C55E),
                    onTap: () {
                      if (Get.isRegistered<DashboardController>()) {
                        Get.find<DashboardController>().currentIndex.value = 2;
                      }
                    },
                  ),
                  _buildQuickActionCard(
                    label: "My Teams",
                    icon: Icons.group_outlined,
                    backgroundColor: const Color(0xFFFAF5FF), // Light purple
                    iconColor: const Color(0xFFA855F7),
                    onTap: () {
                      Get.toNamed(AppRoute.teams);
                    },
                  ),
                  _buildQuickActionCard(
                    label: "Join Camp",
                    icon: Icons.calendar_today_outlined,
                    backgroundColor: const Color(0xFFFFF7ED), // Light orange
                    iconColor: const Color(0xFFF97316),
                    onTap: () {
                      if (Get.isRegistered<DashboardController>()) {
                        Get.find<DashboardController>().currentIndex.value = 3;
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  // Info Tab Content (View Mode)
  Widget _buildInfoContent(ProfileController controller) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header of Personal Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.startEditing();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          size: 16.r,
                          color: AppColors.primaryNavy,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Info Items showing dynamic saved values
              Obx(() => Column(
                    children: [
                      _buildInfoBox(Icons.email_outlined, "Email", controller.email.value),
                      SizedBox(height: 12.h),
                      _buildInfoBox(Icons.phone_outlined, "Phone", controller.phone.value),
                      SizedBox(height: 12.h),
                      _buildInfoBox(Icons.calendar_today_outlined, "Date of Birth", controller.dob.value),
                      SizedBox(height: 12.h),
                      _buildInfoBox(Icons.scale_outlined, "Weight", "${controller.weight.value} kg"),
                      SizedBox(height: 12.h),
                      _buildInfoBox(Icons.location_on_outlined, "Location", controller.dojo.value.contains("Dhaka") ? "Dhaka, Bangladesh" : "Sydney, Australia"),
                      SizedBox(height: 12.h),
                      _buildInfoBox(Icons.workspace_premium_outlined, "Training Gym", controller.dojo.value),
                    ],
                  )),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Logout Button
        OutlinedButton.icon(
          onPressed: () {
            Get.offAllNamed(AppRoute.login);
          },
          icon: Icon(
            Icons.logout,
            size: 18.r,
            color: const Color(0xFFEF4444),
          ),
          label: Text(
            "Logout",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFEF4444),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: const Color(0xFFFCA5A5), width: 1.5.w),
            minimumSize: Size(double.infinity, 48.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  // Info Tab Content (Edit Mode)
  Widget _buildEditContent(BuildContext context, ProfileController controller) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header of Personal Info with Edit/Cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.cancelEditing();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          size: 16.r,
                          color: AppColors.primaryNavy,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryNavy,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Inputs for edit mode
              _buildEditField(
                label: "Full Name",
                fieldController: controller.fullNameController,
              ),
              SizedBox(height: 16.h),
              _buildEditField(
                label: "Email",
                fieldController: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              _buildEditField(
                label: "Phone",
                fieldController: controller.phoneController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.h),
              _buildEditField(
                label: "Date of Birth",
                fieldController: controller.dobController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1995, 5, 15),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: AppColors.secondaryGreen,
                            onPrimary: Colors.white,
                            onSurface: AppColors.primaryNavy,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    controller.dobController.text =
                        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                  }
                },
              ),
              SizedBox(height: 16.h),
              _buildEditField(
                label: "Weight (kg)",
                fieldController: controller.weightController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),
              _buildEditField(
                label: "Height (cm)",
                fieldController: controller.heightController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),
              _buildBeltDropdown(controller, context),
              SizedBox(height: 16.h),
              _buildEditField(
                label: "Dojo",
                fieldController: controller.dojoController,
              ),
              SizedBox(height: 24.h),

              // Save Changes Button
              ElevatedButton(
                onPressed: () {
                  controller.saveChanges();
                  Get.snackbar(
                    "Success",
                    "Profile changes saved successfully!",
                    backgroundColor: Colors.green.shade50,
                    colorText: Colors.green.shade900,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: EdgeInsets.all(16.r),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryGreen,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Logout Button
        OutlinedButton.icon(
          onPressed: () {
            Get.offAllNamed(AppRoute.login);
          },
          icon: Icon(
            Icons.logout,
            size: 18.r,
            color: const Color(0xFFEF4444),
          ),
          label: Text(
            "Logout",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFEF4444),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: const Color(0xFFFCA5A5), width: 1.5.w),
            minimumSize: Size(double.infinity, 48.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required String label,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 24.r,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(IconData icon, String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF94A3B8),
            size: 20.r,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF94A3B8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryNavy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditField({
    required String label,
    required TextEditingController fieldController,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryNavy,
          ),
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: fieldController,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.primaryNavy,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.secondaryGreen, width: 1.5),
            ),
            filled: true,
            fillColor: const Color(0xFFF1F5F9), // Light grey matching mockup
          ),
        ),
      ],
    );
  }

  Widget _buildBeltDropdown(ProfileController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Belt Rank",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryNavy,
          ),
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: () => _openBeltSelector(context, controller),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                      controller.belt.value,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryNavy,
                      ),
                    )),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.textMuted,
                  size: 20.r,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openBeltSelector(BuildContext context, ProfileController controller) {
    Get.bottomSheet(
      Container(
        height: 350.h,
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
              "Select Belt Rank",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: controller.belts.length,
                itemBuilder: (context, index) {
                  final belt = controller.belts[index];
                  return ListTile(
                    title: Text(
                      belt,
                      style: TextStyle(fontSize: 14.sp, color: AppColors.primaryNavy),
                    ),
                    onTap: () {
                      controller.belt.value = belt;
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import 'controller/qualification_management_controller.dart';

class UploadDocumentController extends GetxController {
  var selectedFileName = "".obs;
  var selectedFileSize = "".obs;

  void selectFile(String name, String size) {
    selectedFileName.value = name;
    selectedFileSize.value = size;
  }

  void clearFile() {
    selectedFileName.value = "";
    selectedFileSize.value = "";
  }

  bool get isFileSelected => selectedFileName.value.isNotEmpty;
}

class UploadDocumentScreen extends StatelessWidget {
  const UploadDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qualificationName = Get.arguments['qualificationName'] ?? 'Full Contact Judge';
    final qualificationController = Get.find<QualificationManagementController>();
    final uploadController = Get.put(UploadDocumentController());

    // If file was already uploaded previously, load it into local controller state
    if (qualificationController.isUploaded(qualificationName)) {
      uploadController.selectFile(
        qualificationController.getFileName(qualificationName),
        "2.4 MB", // static mock file size
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 48.w,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryNavy,
            size: 20.r,
          ),
          onPressed: () => Get.back(),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.karateIcon,
              width: 20.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryNavy,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "OfficialPortal",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: const Color(0xFFF1F5F9),
              backgroundImage: const NetworkImage(
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: const Color(0xFFF1F5F9),
            height: 1.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Title
              Text(
                "Upload Document",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryNavy,
                ),
              ),
              SizedBox(height: 16.h),

              // dynamic instructions alert box with thick green left border
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border(
                    left: BorderSide(
                      color: AppColors.secondaryGreen,
                      width: 4.w,
                    ),
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      color: AppColors.primaryNavy,
                      height: 1.45,
                    ),
                    children: [
                      const TextSpan(
                        text: "Please upload a clear PDF or high-resolution image of your official certification for the ",
                      ),
                      TextSpan(
                        text: qualificationName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: " qualification. This document will be reviewed by the regional governing body.",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Upload File Box area
              GestureDetector(
                onTap: () {
                  // Simulate file picker selection
                  uploadController.selectFile("certificate_v1.pdf", "2.4 MB");
                  Get.snackbar(
                    "File Selected",
                    "Simulated file upload: certificate_v1.pdf",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.primaryNavy,
                    colorText: Colors.white,
                    margin: EdgeInsets.all(16.w),
                    borderRadius: 8.r,
                    duration: const Duration(seconds: 2),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xFFCBD5E1),
                      width: 1.2.w,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Cloud icon container
                      Container(
                        width: 52.w,
                        height: 52.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.cloud_upload_outlined,
                          color: AppColors.secondaryGreen,
                          size: 28.r,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Drag and drop or tap to browse files",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryNavy,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "Maximum file size: 5MB",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28.h),

              // UPLOAD REQUIREMENTS
              Text(
                "UPLOAD REQUIREMENTS",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMuted,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 12.h),
              _buildRequirementLine("File size under 5MB"),
              SizedBox(height: 8.h),
              _buildRequirementLine("Format: PDF, JPG, PNG"),
              SizedBox(height: 8.h),
              _buildRequirementLine("Clear and legible text"),

              SizedBox(height: 28.h),

              // SELECTED FILE section (reactive check)
              Text(
                "SELECTED FILE",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMuted,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 12.h),

              Obx(() {
                if (!uploadController.isFileSelected) {
                  return Text(
                    "No file selected",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textMuted,
                      fontStyle: FontStyle.italic,
                    ),
                  );
                }

                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      // PDF Icon box
                      Container(
                        width: 38.w,
                        height: 38.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.insert_drive_file_outlined,
                          color: AppColors.primaryNavy,
                          size: 20.r,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // File Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              uploadController.selectedFileName.value,
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryNavy,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              uploadController.selectedFileSize.value,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Trash delete button
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: const Color(0xFFEF4444),
                          size: 20.r,
                        ),
                        onPressed: () {
                          uploadController.clearFile();
                          qualificationController.clearUploaded(qualificationName);
                        },
                      ),
                    ],
                  ),
                );
              }),

              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                height: 1.h,
                color: const Color(0xFFF1F5F9),
              ),
              SizedBox(height: 16.h),

              // Info Authenticity confirmation
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.secondaryGreen,
                    size: 20.r,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "By submitting, you confirm that this document is authentic and represents your current standing as an official.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textMuted,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Action submit button
              Obx(() {
                final isSelected = uploadController.isFileSelected;
                return ElevatedButton(
                  onPressed: isSelected
                      ? () {
                          // save document upload details to controller state
                          qualificationController.setUploaded(
                            qualificationName,
                            uploadController.selectedFileName.value,
                          );
                          Get.snackbar(
                            "Document Submitted",
                            "Certificate for $qualificationName submitted.",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppColors.secondaryGreen,
                            colorText: Colors.white,
                            margin: EdgeInsets.all(16.w),
                            borderRadius: 8.r,
                          );
                          if (qualificationName == 'Safety Officer') {
                            Get.offAllNamed(AppRoute.verificationComplete);
                          } else {
                            Get.back(); // navigate back to checklist
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryGreen,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xFFA7F3D0).withValues(alpha: 0.6), // faded green when disabled
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Submit Document",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.white70,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequirementLine(String requirement) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: AppColors.secondaryGreen,
          size: 16.r,
        ),
        SizedBox(width: 8.w),
        Text(
          requirement,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.primaryNavy,
          ),
        ),
      ],
    );
  }
}

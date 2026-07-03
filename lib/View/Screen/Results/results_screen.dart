import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/AppColors/app_colors.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Premium Mock results data
    final results = [
      {
        "title": "National Championship 2025",
        "winner": "Sakil Hossen (Dhaka Dojo)",
        "score": "1st Place - Gold Medal",
        "date": "December 15-18, 2025",
        "category": "Tournaments",
        "icon": Icons.emoji_events,
        "color": const Color(0xFFF59E0B), // Gold
      },
      {
        "title": "Winter Open 2025",
        "winner": "Shane Cullen",
        "score": "Runner Up - Silver Medal",
        "date": "November 22-24, 2025",
        "category": "Tournaments",
        "icon": Icons.emoji_events,
        "color": const Color(0xFF94A3B8), // Silver
      },
      {
        "title": "Inter-University Swim Gala",
        "winner": "Sylhet Stars Swim Club",
        "score": "Overall Team Champions",
        "date": "October 5, 2025",
        "category": "Tournaments",
        "icon": Icons.emoji_events,
        "color": const Color(0xFFB45309), // Bronze
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Results",
          style: TextStyle(
            color: AppColors.primaryNavy,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(24.r),
        itemCount: results.length,
        itemBuilder: (context, index) {
          final res = results[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.all(16.r),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Trophy/Event Icon Badge
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: (res["color"] as Color).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    res["icon"] as IconData,
                    color: res["color"] as Color,
                    size: 24.r,
                  ),
                ),
                SizedBox(width: 16.w),
                
                // Result Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        res["title"] as String,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryNavy,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Icon(Icons.person, color: AppColors.secondaryGreen, size: 14.r),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              res["winner"] as String,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1E293B),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        res["score"] as String,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryGreen,
                        ),
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
                          Icon(Icons.calendar_today, color: AppColors.textMuted, size: 12.r),
                          SizedBox(width: 6.w),
                          Text(
                            res["date"] as String,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

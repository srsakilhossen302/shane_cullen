import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.karateIcon,
              width: 100.0,
              height: 100.0,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryNavy,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              StaticString.akkaOceania,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              color: AppColors.secondaryGreen,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/constants/auth_controller.dart';

import '../../constants/app_colors.dart';
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SplashScreenBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nimbus",
              style: GoogleFonts.sora(fontWeight: FontWeight.w800, fontSize: 44, color: AppColors.SplashScreenPrimaryText),
            ),
            Text(
              "Weather & city guide",
              style: GoogleFonts.dmSans(color: AppColors.SplashScreensSecondaryText, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Checking your session...",
              style: GoogleFonts.dmMono(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.SplashScreensSessionText),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                // Loading State
                return CircularProgressIndicator(
                  strokeWidth: 4,
                  backgroundColor: AppColors.SplashScreenPrimaryText.withValues(alpha: 0.25),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.SplashScreenPrimaryText,
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
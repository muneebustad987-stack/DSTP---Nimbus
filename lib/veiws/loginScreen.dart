import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/constants/auth_controller.dart';
import 'package:nimbus/veiws/SignupScreen.dart';
import '../../constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'demo@nimbus.app');
  final _passwordController = TextEditingController(text: 'demo1234');

  AuthController authController = Get.find<AuthController>();

  InputDecoration _fieldDecoration(String hint, {Widget? suffixIcon}) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.fieldBorderColor),
    );
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.LoginScreenFieldHint,
      ),
      filled: true,
      fillColor: AppColors.SplashScreenPrimaryText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: AppColors.LoginScreenIconBg, width: 1.5),
      ),
      suffixIcon: suffixIcon,
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.LoginScreenSecondaryText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LoginScreenBg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.LoginScreenIconBg,
                      ),
                      child: Icon(
                        Icons.wb_sunny_outlined,
                        color: AppColors.SplashScreenPrimaryText,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Heading
                    Text(
                      "Welcome back",
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                        letterSpacing: -0.5,
                        color: AppColors.LoginScreenPrimaryText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Log in to see weather for the cities you care about.",
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        height: 1.45,
                        fontWeight: FontWeight.w400,
                        color: AppColors.LoginScreenSecondaryText,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Email
                    _label("Email"),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: _fieldDecoration("you@example.com"),
                    ),
                    const SizedBox(height: 18),

                    // Password
                    _label("Password"),
                    const SizedBox(height: 8),

                    Obx(
                      () => TextField(
                        controller: _passwordController,
                        obscureText: authController.isProtected.value,
                        decoration: _fieldDecoration(
                          "Enter your password",
                          suffixIcon: IconButton(
                            onPressed: authController.changeObscure,
                            icon: Icon(
                              authController.isProtected.value ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                              color: AppColors.LoginScreenSecondaryText,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Log in button (full width)
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Email and Password are required",
                                colorText: Colors.red,
                                snackPosition: SnackPosition.TOP,
                              );
                            } else {
                              authController.login(email: _emailController.text, pass: _passwordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.LoginScreenIconBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: authController.isLoading.value
                              ? Row(
                                  spacing: 12,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        backgroundColor: AppColors.SplashScreenPrimaryText.withValues(alpha: 0.25),
                                        valueColor: const AlwaysStoppedAnimation<Color>(
                                          AppColors.SplashScreenPrimaryText,
                                        ),
                                      ),
                                    ),
                                    const Text("Logging in..", style: TextStyle(color: AppColors.SplashScreenPrimaryText, fontSize: 18)),
                                  ],
                                )
                              : Text(
                                  "Log in",
                                  style: GoogleFonts.dmSans(
                                    color: AppColors.SplashScreenPrimaryText,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "New to Nimbus? ",
                            style: GoogleFonts.dmSans(
                              fontSize: 15,
                              color: AppColors.LoginScreenSecondaryText,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignupScreen());
                              authController.isProtected.value = true;
                              Future.delayed(Duration(milliseconds: 300), () {
                                _emailController.clear();
                                _passwordController.clear();
                              });
                            },
                            child: Text(
                              "Create account",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.LoginScreenIconBg,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimbus/constants/auth_controller.dart';
import 'package:nimbus/veiws/SignupScreen.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  AuthController controller = Get.find<AuthController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.22,
                  height: screenWidth * 0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("sun.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.025),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: screenWidth * 0.075,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Log in to see weather for the cities you care about.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.038,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: screenHeight * 0.035),

                // Email
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: screenWidth * 0.038,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "123@example.com",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: screenWidth * 0.038,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Password
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    bottom: screenHeight * 0.01,
                  ),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              Obx(()=>TextField(
                textInputAction: TextInputAction.done,
                obscureText: controller.isObscured.value,
                controller: passwordController,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: screenWidth * 0.038,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    color: Colors.black12,
                    fontSize: screenWidth * 0.038,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(controller.isObscured.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                      color: Colors.black38,
                      size: screenWidth * 0.05,
                    ),
                    onPressed: controller.changeObscured,
                  ),
                ),
              ),
              ),

                SizedBox(height: screenHeight * 0.03),

                // Login Button
                GetBuilder<AuthController>(
                  builder: (c) {
                    return SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (emailController.text.isEmpty &&
                              passwordController.text.isEmpty) {
                            Get.snackbar(
                              "Error",
                              "Email and Password required",
                            );
                          } else {
                            c.logIn(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                ),

                SizedBox(height: screenHeight * 0.035),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New to Nimbus? ",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUpPage());
                        },
                        child: Text(
                          "Create account",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: screenWidth * 0.035,
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
        ),
      ),
    );
  }
}
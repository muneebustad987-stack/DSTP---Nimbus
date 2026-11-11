import 'dart:convert';

import 'package:get_x/get.dart';
import 'package:nimbus/constants/api_constant.dart';
import 'package:nimbus/constants/api_controller.dart';
import 'package:nimbus/veiws/demoStudent.dart';
import 'package:nimbus/veiws/loginScreen.dart';


class AuthController extends GetxController {
  bool isObscured = true;
  bool isLoading = false;

  void changeObscured() {
    isObscured = !isObscured;
    update();
  }

  @override
  void onReady() {
    screenLoader();
    // TODO: implement onReady
    super.onReady();
  }

  // Log In Screen
  Future<void> logIn({
    required String emailAddress,
    required String password,
  }) async {
    isLoading = true;
    update();

    var myBody = {'email': emailAddress, 'password': password};

    var response = await ApiController().post(
      url: ApiConstant.logInApi,
      body: myBody,
    );

    await Future.delayed(Duration(seconds: 2));
    isLoading = false;

    if (response.$1 == 201 || response.$1 == 200) {
      var logInResponse = jsonDecode(response.$2);
      String token = logInResponse['token'];
      ApiController().saveToken(token: token);
      Get.snackbar("Welcome To", "${logInResponse["user"]["name"]}");
      Get.offAll(() => Demostudent());
    } else {
      var loginRespose = jsonDecode(response.$2);
      Get.snackbar("Error", "${loginRespose['message'] ?? 'Login failed'}");
    }
  }

  // Sign Up Screen
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    update();

    // var name = nameController.text;
    // var email = emailController.text;
    // var password = passwordController.text;

    var myBody = {'name': name, 'email': email, 'password': password};

    var response = await ApiController().post(
      url: ApiConstant.registerApi,
      body: myBody,
    );

    await Future.delayed(Duration(seconds: 2));
    isLoading = false;

    if (response.$1 == 201 || response.$1 == 200) {
      Get.snackbar("Welcome", "Your Account Is Registered");
      Get.to(() => LogInPage());
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text("Successfully Login")));
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => const LogInPage()),
      //   );
    } else {
      var loginRespose = jsonDecode(response.$2);
      Get.snackbar("Error", '${loginRespose['message'] ?? 'Login failed'}');

      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(loginRespose['message'] ?? 'Login failed')),
      //   );
    }
  }

  // Splash Screen
  Future<void> screenLoader() async {
    var response = await ApiController().get(
      url: ApiConstant.rememberMeApi,
      isToken: true,
    );
    if (response.$1 == 201 || response.$1 == 200) {
      Get.offAll(() => Demostudent());
      //   var route = MaterialPageRoute(
      //     builder: (context) => const DashboardScreen(),
      //   );
      //   Navigator.pushReplacement(context, route);
    } else {
      Get.offAll(() => LogInPage());
      //   var route = MaterialPageRoute(builder: (context) => const LogInPage());
      //   Navigator.pushReplacement(context, route);
    }
  }
}
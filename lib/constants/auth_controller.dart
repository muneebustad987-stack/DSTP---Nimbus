import 'dart:convert';
import 'package:get/get.dart';

import 'package:nimbus/constants/api_constant.dart';
import 'package:nimbus/constants/api_controller.dart';
import 'package:nimbus/veiws/botto_sheet.dart';
import 'package:nimbus/veiws/demoStudent.dart';
import 'package:nimbus/veiws/loginScreen.dart';


class AuthController extends GetxController {
  RxBool isObscured = true.obs;
  RxBool isLoading = false.obs;

  void changeObscured() {
    isObscured.value = !isObscured.value;
  }

  @override
  void onReady() {
    screenLoader();
    super.onReady();
  }

  // Log In Screen
  Future<void> logIn({
    required String emailAddress,
    required String password,
  }) async {
    isLoading = true.obs;
    update();

    var myBody = {'email': emailAddress, 'password': password};

    var response = await ApiController().post(
      url: ApiConstant.logInApi,
      body: myBody,
    );

    await Future.delayed(Duration(seconds: 2));
    isLoading = false.obs;

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
    isLoading = true.obs;
    update();


    var myBody = {'name': name, 'email': email, 'password': password};

    var response = await ApiController().post(
      url: ApiConstant.registerApi,
      body: myBody,
    );

    await Future.delayed(Duration(seconds: 2));
    isLoading = false.obs;

    if (response.$1 == 201 || response.$1 == 200) {
      Get.snackbar("Welcome", "Your Account Is Registered");
      Get.to(() => LogInPage());
    } else {
      var loginRespose = jsonDecode(response.$2);
      Get.snackbar("Error", '${loginRespose['message'] ?? 'Login failed'}');

    }
  }

  // Splash Screen
  Future<void> screenLoader() async {
    var response = await ApiController().get(
      url: ApiConstant.rememberMeApi,
      isToken: true,
    );
    if (response.$1 == 201 || response.$1 == 200) {
      Get.offAll(() => BottoSheet());

    } else {
      Get.offAll(() => LogInPage());

    }
  }
}
import 'dart:convert';

import 'package:get/get.dart';
import 'package:nimbus/constants/api_constant.dart';
import 'package:nimbus/veiws/botto_sheet.dart';
import 'package:nimbus/veiws/loginScreen.dart';
import 'api_controller.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isProtected = true.obs;

  @override
  void onReady() {
    authMe();
    super.onReady();
  }


  Future<void> authMe() async {
    isLoading.value = true;
    var response = await ApiController().get(
      url: ApiConstant.rememberMeApi,
      isToken: true,
    );
    if (response.$1 == 200 || response.$1 == 201) {
      var loginResponse = jsonDecode(response.$2);
      Get.snackbar("Welcome back", "${loginResponse["user"]["name"]}");

      Get.offAll(
        () => DashboardScreen(
          user: loginResponse["user"]["name"],
        ),
      );
    } else {
      Get.offAll(() => LoginScreen());
    }
    isLoading.value = false;
  }

  void changeObscure() {
    isProtected.value = !isProtected.value;
  }

  Future<void>login({required String email, required String pass}) async {
    isLoading.value = true;
    update();

    var myBody = {"email": email, "password": pass};

    var response = await ApiController().post(
      url: ApiConstant.logInApi,
      body: myBody,
    );

    isLoading.value = false;
    update();

    if (response.$1 == 200 || response.$1 == 201) {
      var loginResponse = jsonDecode(response.$2);
      String token = loginResponse['token'];
      ApiController().saveToken(token: token);
      Get.snackbar("Welcome", "${loginResponse["user"]["name"]}");

      Get.offAll(() => DashboardScreen(user: loginResponse["user"]["name"]));
    } else {
      var loginResponse = jsonDecode(response.$2);

      Get.snackbar("Error", "${loginResponse['message']}");
    }
  }
}
import 'dart:convert';

import 'package:get_x/get.dart';
import 'package:nimbus/constants/api_constant.dart';
import 'package:nimbus/constants/api_controller.dart';

class HomeController extends GetxController {
  RxList regionList = ["ALL"].obs;
  RxInt selectedRegionIndex = 0.obs;
  RxBool isRegionLoading = false.obs;

  @override
  void onInit() {
    changeRegion();
    super.onInit();
  }

  HomeController homeController = Get.find<HomeController>();
 void regionTab (int index) {
   selectedRegionIndex.value = index;
 }

 Future<void> changeRegion() async {
    isRegionLoading.value = true;

    var response = await ApiController().get(url: ApiConstant.regionApi);

    try{
      if (response.$1 == 200 || response.$1 == 201) {
        var regionResponse = jsonDecode(response.$2)['data'];
        regionList.add('ALL');
        for (var i in regionResponse) {
          regionList.add(i["name"]);
        }
        print("REGION LIST $regionList");
      } else {}
    } catch (e) {
      print("ERROR $e");
    }finally {
      isRegionLoading.value = false;
    }
 }

}
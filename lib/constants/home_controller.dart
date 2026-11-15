import 'dart:convert';

import 'package:get/get.dart';
import 'package:nimbus/constants/api_constant.dart';
import 'package:nimbus/model/city.dart';

import '../model/cities_weather_model.dart';
import 'api_controller.dart';

class HomeController extends GetxController {
  RxList<dynamic> regionList = [].obs;
  RxInt selectedRegionIndex = 0.obs;
  RxBool isRegionLoading = false.obs;

  // Cities Weather
  int cityPage = 1;
  bool hasNext = true;
  List<City> cities = [];
  bool isCitiesLoading = false;

  @override
  void onInit() {
    getRegions();
    getCities();
    super.onInit();
  }

  void regionTap(int index) {
    selectedRegionIndex.value = index;
  }

  Future<void> getRegions() async {
    isRegionLoading.value = true;

    var response = await ApiController().get(url: ApiConstant.regionApi);

    try {
      if (response.$1 == 200 || response.$1 == 201) {
        var regionResponse = jsonDecode(response.$2)['data'];
        regionList.add("All");
        for (var i in regionResponse) {
          regionList.add(i["name"]);
        }
      } else {}
    } catch (e) {
      print("ERROR $e");
    } finally {
      isRegionLoading.value = false;
    }
  }

  Future<void> getCities() async {
    if (isCitiesLoading || !hasNext) return;
    isCitiesLoading = true;
    update();

    try {
      var response = await ApiController().get(url: ApiConstant.cityApi, queryPram: {'page': cityPage.toString(), 'limit': '8'});
      if (response.$1 == 200 || response.$1 == 201) {
        final citiesWeather = cityWeatherFromJson(response.$2);
        if (citiesWeather.data != null) {
          cities.addAll(citiesWeather.data!);
          hasNext = citiesWeather.meta!.hasNext!;
          cityPage++;
        }
      } else {}
    } catch (e) {
      print("ERROR $e");
    } finally {
      isCitiesLoading = false;
      update();
    }
  }
}
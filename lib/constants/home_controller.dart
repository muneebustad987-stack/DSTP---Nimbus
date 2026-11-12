import 'dart:convert';

import 'package:get/get.dart';
import 'package:nimbus/constants/api_constant.dart';
import 'package:nimbus/constants/api_controller.dart';

import '../model/cities_weather_model.dart';
import '../model/city.dart';

class HomeController extends GetxController {
  RxList regionList = ["ALL"].obs;
  RxInt selectedRegionIndex = 0.obs;
  RxBool isRegionLoading = false.obs;

//weather api
  int cityPage = 1;
  bool hasNext = true;
  List<City> cities = [];
  bool isCitiesLoading = true;

  @override
  void onInit() {
    changeRegion();
    getcities();
    super.onInit();
  }

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

 //Cities Api
 getcities() async {
   isCitiesLoading = true;
   update();

   try{
     var response = await ApiController ().get(url: ApiConstant.cityApi(cityPage));
     if (response.$1 == 200 || response.$1 == 201) {
       final cityWeather = cityWeatherFromJson(response.$2);
       if(cityWeather.data!=null){
         cities.addAll(cityWeather.data!);
         hasNext=cityWeather.meta!.hasNext!;
         cityPage++;
       }}
       else{}
     }catch (e) {
       print("ERROR $e");
   }finally{
       isCitiesLoading = true;
       update();
   }
   }
 }

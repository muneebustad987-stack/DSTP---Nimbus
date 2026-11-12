import 'cities_weather_model.dart';
import 'city.dart';

class CityWeather {
  final List<City>? data;
  final Meta? meta;

  CityWeather({
    this.data,
    this.meta,
  });

  factory CityWeather.fromJson(Map<String, dynamic> json) => CityWeather(
    data: json["data"] == null ? [] : List<City>.from(json["data"]!.map((x) => City.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}
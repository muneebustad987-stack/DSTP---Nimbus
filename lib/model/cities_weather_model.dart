// To parse this JSON data, do
//
//     final cityWeather = cityWeatherFromJson(jsonString);

import 'dart:convert';

import 'cityWeather_model.dart';

CityWeather cityWeatherFromJson(String str) => CityWeather.fromJson(json.decode(str));

String cityWeatherToJson(CityWeather data) => json.encode(data.toJson());


class Meta {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;
  final bool? hasNext;
  final bool? hasPrev;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPages,
    this.hasNext,
    this.hasPrev,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPages: json["totalPages"],
    hasNext: json["hasNext"],
    hasPrev: json["hasPrev"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPages": totalPages,
    "hasNext": hasNext,
    "hasPrev": hasPrev,
  };
}

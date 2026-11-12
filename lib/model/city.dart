import 'Weather.dart';

class City {
  final String? id;
  final String? name;
  final String? country;
  final String? region;
  final String? tagline;
  final int? population;
  final Weather? weather;

  City({
    this.id,
    this.name,
    this.country,
    this.region,
    this.tagline,
    this.population,
    this.weather,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    region: json["region"],
    tagline: json["tagline"],
    population: json["population"],
    weather: json["weather"] == null ? null : Weather.fromJson(json["weather"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country,
    "region": region,
    "tagline": tagline,
    "population": population,
    "weather": weather?.toJson(),
  };
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/weather_model.dart';

class WeatherService {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  // 1. City Name ke zariye weather fetch karne ka method
  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('City not found');
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

Future<Weather> getWeatherByCoordinates(double lat, double lon) async {
  var baseUrl;
  var apiKey;
  final response = await http.get(
    Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}

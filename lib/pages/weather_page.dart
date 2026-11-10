import 'package:flutter/material.dart';
import 'package:my_app/models/weather_model.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  //api key
  final weatherService = WeatherService('YOUR_OPENWEATHERMAP_API_KEY');
  Weather? weather;

  //fetch the weather
  _fetchWeather() async {
    // get the current city
  String cityName = await _weatherService.get

    // get the weather for the city



  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

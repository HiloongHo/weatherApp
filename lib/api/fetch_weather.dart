import 'dart:convert';

import 'package:weatherapp_starter_project/api/api_key.dart';
import 'package:weatherapp_starter_project/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData =WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url;
  url = "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$lat, $lon&aqi=no";
  return url;
}
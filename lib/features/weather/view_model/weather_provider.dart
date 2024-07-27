import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/weather/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weather;
  String? errorMessage;
  bool isLoading = false;

  Future<void> getData(String city) async {
    String apiKey = "71ced824c06aeece5832d666f4f632a8";
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        weather = WeatherModel.fromJson(responseBody);
        errorMessage = null;
      } else {
        errorMessage = 'Failed to load weather data';
        weather = null;
      }
    } catch (e) {
      errorMessage = e.toString();
      weather = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

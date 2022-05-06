import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherController extends GetxController {
  WeatherModel? weather;
  Future<void> getWeather(String location) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    weather = WeatherModel.fromJson(data);
    update();
  }
}

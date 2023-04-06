import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'dart:convert';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e3e54c2aa0433e86695a41a0c2afcaf7&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body));
    return Weather.fromJson(body);
  }
}

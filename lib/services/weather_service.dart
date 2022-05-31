import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherService {
  String baseUrl = 'https://www.metaweather.com';

  Future<int> getCityId({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    http.Response response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);
    int cityId = data[0]['woeid'];
    return cityId;
  }

  Future<Weather?> getWeather({required String cityName}) async {
    Weather? weather;
    try {
      int id = await getCityId(cityName: cityName);
      Uri url = Uri.parse('$baseUrl/api/location/$id/');
      http.Response response = await http.get(url);
      Map<String, dynamic> jsondata = jsonDecode(response.body);

      Map<String, dynamic> data = jsondata['consolidated_weather'][0];
      String nameCity = jsondata['title'];
      weather =Weather.fromJson(data, nameCity);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}

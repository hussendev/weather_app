import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/search_page.dart';

class WeatehrProvider extends ChangeNotifier {
  Weather? _weatherData;
  set weatherData(Weather? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  Weather? get weatherData => _weatherData;
}

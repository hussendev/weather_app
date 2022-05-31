import 'package:flutter/material.dart';

class Weather {
  String weatherStateName;
  String cityName;
  String date;
  double minTemp;
  double maxTemp;
  double temp;
  Weather(
      {required this.weatherStateName,
      required this.date,
      required this.minTemp,
      required this.maxTemp,
      required this.temp,
      required this.cityName});

  factory Weather.fromJson(Map<String, dynamic> data,String nameCity) {
    return Weather(
        weatherStateName: data['weather_state_name'],
        date: data['applicable_date'],
        minTemp: data['min_temp'],
        maxTemp: data['max_temp'],
        temp: data['the_temp'],cityName: nameCity);
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm'||weatherStateName=='Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.blueGrey;
    } else {
      return Colors.amber;
    }
  }
}

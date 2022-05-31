import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class Searchpage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) async {
              cityName = value;

              WeatherService service = WeatherService();
              Weather? weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatehrProvider>(context, listen: false).weatherData =
                  weather;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                labelText: 'searchs',
                hintText: 'Enter a city',
                suffixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
      ),
    );
  }
}

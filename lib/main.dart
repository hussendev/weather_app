import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (conteext) {
        return WeatehrProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatehrProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatehrProvider>(context)
                      .weatherData!
                      .getThemColor()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

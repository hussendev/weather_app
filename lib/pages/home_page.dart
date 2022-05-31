import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatehrProvider>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Searchpage();
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: data == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              color: Provider.of<WeatehrProvider>(context)
                  .weatherData!
                  .getThemColor(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        Provider.of<WeatehrProvider>(context, listen: true)
                            .weatherData!
                            .cityName,
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold)),
                    Text('${data.date}',
                        style: TextStyle(
                          fontSize: 25,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(data.getImage()),
                          Spacer(
                            flex: 1,
                          ),
                          Text('${data.temp.toInt()}',
                              style: TextStyle(
                                fontSize: 45,
                              )),
                          Spacer(
                            flex: 1,
                          ),
                          Column(
                            children: [
                              Text('max: ${data.maxTemp.toInt()}'),
                              Text(
                                'min: ${data.minTemp.toInt()}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text('${data.weatherStateName}',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
    );
  }
}

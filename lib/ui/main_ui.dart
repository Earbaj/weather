import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weather_forcast.dart';
import 'package:weather/network/network_utils.dart';
import 'package:weather/ui/custome_weather_icon.dart';

import 'mid_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<WeatherForcast> forcastObject;
  String _cityName = "Rangpur";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forcastObject = Network().getWeatherForecast(cityName: _cityName);
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            onSubmitted: (value){
              setState(() {
                _cityName = value;
                forcastObject = Network().getWeatherForecast(cityName: _cityName);
              });
            },
            decoration: InputDecoration(
              hintText: "Enter City Name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Container(
          child: FutureBuilder<WeatherForcast>(
            future: forcastObject,
            builder:(BuildContext context, AsyncSnapshot<WeatherForcast> snapsot){
              if(snapsot.hasData){
                var forcast = snapsot.data!.list[0];
                return Column(
                  children: [
                    midView(snapsot),
                    SizedBox(height: 10.0,),
                    //Icon(FontAwesomeIcons.cloud, size: 160.0, color: Colors.blue,),
                    getWeatherIcon(description: forcast.weather[0].main, color: Colors.blue, size: 160.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${forcast.temp.day.toStringAsFixed(0)}°F",
                            style: TextStyle(
                              fontSize: 36.0
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text("${forcast.weather[0].description}",
                            style: TextStyle(
                              fontSize: 20.0
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("${forcast.speed.toStringAsFixed(1)} mi/h",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Icon(FontAwesomeIcons.wind, size: 20.0, color: Colors.blueGrey,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("${forcast.humidity.toStringAsFixed(0)} %",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20.0, color: Colors.lightGreen,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("${forcast.temp.max} °F",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Icon(FontAwesomeIcons.temperatureHigh, size: 20.0, color: Colors.red,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }else{
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}

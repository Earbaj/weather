import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weather_forcast.dart';
import 'package:weather/network/network_utils.dart';
import 'package:weather/ui/bottom_view.dart';
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
                    bottomView(snapsot, context),
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

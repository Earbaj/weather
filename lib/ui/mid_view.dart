import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_forcast.dart';
import 'package:weather/ui/custome_weather_icon.dart';


Widget midView(AsyncSnapshot<WeatherForcast> snapsot){
  var forcast = snapsot.data!.list[0];
  var country = snapsot.data!.city.country;
  var city = snapsot.data!.city.name;
  var date = snapsot.data!.list[0].dt;
  var formattedDate =
  new DateTime.fromMillisecondsSinceEpoch(date * 1000);
  Container view = Container(
    child: Column(
      children: [
        Text("${city}" + ", " + "${country}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        ),
        SizedBox(height: 5.0,),
        Text("${DateFormat("EEEE, MMM d, y").format(formattedDate)}"),
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
                  Text("${forcast.temp.max.toStringAsFixed(0)} °F",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Icon(FontAwesomeIcons.temperatureHigh, size: 20.0, color: Colors.red,),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
  return view;
}
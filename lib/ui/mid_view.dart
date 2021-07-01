import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_forcast.dart';


Widget midView(AsyncSnapshot<WeatherForcast> snapsot){
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
      ],
    ),
  );
  return view;
}
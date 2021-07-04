import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_forcast.dart';
import 'package:weather/ui/custome_weather_icon.dart';

Widget bottomView(AsyncSnapshot<WeatherForcast> snapsot, BuildContext context) {
  var forcast = snapsot.data!.list;
  Container view = Container(
    child: Column(
      children: [
        Text("7 days forecast"),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: forcast.length,
            separatorBuilder: (context, index){
              return SizedBox(width: 8.0,);
            },
            itemBuilder: (context, index){
              var daysofweek = "";
              var fullDate = new DateTime.fromMillisecondsSinceEpoch(forcast[index].dt*1000);
              var formated_date = DateFormat("EEEE, MMM d, y").format(fullDate);
              daysofweek = formated_date.split(",")[0];
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xff9661C3), Colors.white],
                      begin: Alignment.topLeft, end: Alignment.bottomRight
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(daysofweek),
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 34.0,
                            backgroundColor: Colors.white,
                            child: getWeatherIcon(description: forcast[index].weather[0].main, color: Colors.blue, size: 34.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
  return view;
}

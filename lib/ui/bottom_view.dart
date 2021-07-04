import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_forcast.dart';

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
            itemCount: forcast.length,
            separatorBuilder: (context, index){
              return SizedBox(width: 8.0,);
            },
            itemBuilder: (context, index){
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

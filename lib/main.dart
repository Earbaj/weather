import 'package:flutter/material.dart';
import 'package:weather/model/weather_forcast.dart';
import 'package:weather/network/network_utils.dart';
import 'package:weather/ui/main_ui.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MainPage(),
      ),
    )
  );
}

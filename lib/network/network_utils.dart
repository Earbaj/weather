import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather/model/weather_forcast.dart';

class Network {
  Future<WeatherForcast> getWeatherForecast({required String cityName}) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
        "&appid=4b61ba559f92a70dd75123c49b3bb707&units=imperial"; //change to metric or imperial

    Response response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      // we get the actual mapped model ( dart object )
      print("weather data: ${response.body}");
      return WeatherForcast.fromJson(json.decode(response.body));
    }else {
      throw Exception("Error getting weather forecast");
    }

  }
}
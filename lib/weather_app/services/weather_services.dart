import 'dart:convert';

import 'package:collection_of_widgets/weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServices  {

   final String apiKey = "9569e2570526066f569959bfb31fc967";

   Future <WeatherModel> fetchData(String cityName) async {
    
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey' ;

    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200 ){
      final body = response.body;
      final decode = jsonDecode(body);

      return WeatherModel.fromMap(decode);
    }
    else {
      throw Exception("Failed to load and fetch the data ");
    }

  }

}
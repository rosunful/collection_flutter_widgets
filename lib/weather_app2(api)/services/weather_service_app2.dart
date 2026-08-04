import 'dart:convert';
import 'package:collection_of_widgets/weather_app2(api)/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServiceApp2 {
  final String apiKey = "9569e2570526066f569959bfb31fc967";

  Future<WeatherModelApp2> fetchDataWeather(String cityName) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey";

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    //if the success response
    if (response.statusCode == 200) {
      final body = response.body;
      final decode = jsonDecode(body);
      return WeatherModelApp2.fromMap(decode);
    }
    //if the bad response
    else {
      throw Exception("failed to load the data ");
    }
  }
}

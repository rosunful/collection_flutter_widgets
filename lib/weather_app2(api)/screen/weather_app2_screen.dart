import 'package:collection_of_widgets/weather_app2(api)/model/weather_model.dart';
import 'package:collection_of_widgets/weather_app2(api)/services/weather_service_app2.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2();
}

class _HomeScreen2 extends State<HomeScreen2> {
  final WeatherServiceApp2 _obj = WeatherServiceApp2();

  WeatherModelApp2? weather;

 void generateWeatherData(String cityName) async {
  final enteredCity = cityName.trim();

  if (enteredCity.isEmpty) return;

  final weatherData = await _obj.fetchDataWeather(enteredCity);

  setState(() {
    weather = weatherData;
    passName?.clear();
  });
}

  TextEditingController? passName ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WeatherApp2")),
      body: SafeArea(
        child: Column(
          spacing: 40,
          children: [
            TextField(
              controller: passName,
              //we will call the function in here !
              onSubmitted: generateWeatherData,
              decoration: InputDecoration(
                hintText: "eg :Pokhara",
                label: Text("City Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
              ),
            ),

            Container(
              color: Colors.teal,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.sunny),
                    ),
                  ),

                  Column(
                    
                    spacing: 40,
                    children: [
                      Text('${weather?.placeName ?? ''}'),
                      Text('${weather?.description ?? ''}'),
                      Text('${weather?.humidity ?? ''}'),
                      Text('${weather?.pressure ?? ''}'),
                      Text('${weather?.temp ?? ''}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

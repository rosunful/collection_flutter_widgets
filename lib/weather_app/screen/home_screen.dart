import 'package:collection_of_widgets/weather_app/model/weather_model.dart';
import 'package:collection_of_widgets/weather_app/services/weather_services.dart';
import 'package:collection_of_widgets/weather_app/widgets/weather_card_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  //instance of the weather services is made
  // so that we can access to the method
  // that is inside of the weather services class
  final WeatherServices _service = WeatherServices();

  //this is for the taking name form the user
  final TextEditingController passName = TextEditingController();

  bool _isLoading = false;

  WeatherModel? _weather;

  void _getWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weather = await _service.fetchData(passName.text);

      setState(() {
        _weather = weather;
        _isLoading = false;
      });
  } catch (e) {
  setState(() {
    _isLoading = false;
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Error: $e")),
  );
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passName,
                decoration: InputDecoration(
                  hintText: "Enter your city name",
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: _getWeather,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey.withValues(alpha: 0.5),
                  foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Get Weather",
                  style: TextStyle(fontSize: 18),
                ),
              ),

              if (_isLoading) ...[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ] else if (_weather != null) ...[
                WeatherCard(weather: _weather!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

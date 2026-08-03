import 'package:collection_of_widgets/weather_app(api)/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Lottie.asset('assets/icons8-sun.json', height: 150, width: 150),
          Text(
            weather.cityName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "${weather.temperature.toStringAsFixed(1)}°C",
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            weather.description,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          // Add your Rows for Humidity, Wind, Sunrise/Sunset here
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.water_drop, color: Colors.white),
                  Text(
                    "${weather.humidity}%",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text("Humidity", style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.wind_power, color: Colors.white),
                  Text(
                    "${weather.windSpeed} m/s",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text("Wind", style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.wb_sunny, color: Colors.orange),
                  Text(
                    "${DateTime.fromMillisecondsSinceEpoch(weather.sunrise * 1000).minute}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text("Sunrise", style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.brightness_3, color: Colors.purple),
                  Text(
                    "${DateTime.fromMillisecondsSinceEpoch(weather.sunset * 1000).minute}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text("Sunset", style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

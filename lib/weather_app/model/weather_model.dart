class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  // obj to json
  Map<String, dynamic> toMap() {
    return {
      "d.cityname": cityName,
      "d.temperature": temperature,
      "d.description": description,
      "d.humidity": humidity,
      "d.windSpeed": windSpeed,
      "d.sunrise": sunrise,
      "d.sunset": sunset,
    };
  }

  //json to obj
  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cityName: map['name'] as String,
      temperature: (map['main']['temp'] as num).toDouble() - 273.15,
      description: map['weather'][0]['description'] as String,
      humidity: map['main']['humidity'] as int,
      windSpeed: (map['wind']['speed'] as num).toDouble(),
      sunrise: map['sys']['sunrise'] as int,
      sunset: map['sys']['sunset'] as int,
    );
  }
}

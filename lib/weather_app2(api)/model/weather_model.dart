class WeatherModelApp2 {
  String? placeName;
  String? description;
  double? temp;
  int? pressure;
  int? humidity;

  WeatherModelApp2({
    required this.placeName,
    required this.description,
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherModelApp2.fromMap(Map<String, dynamic> mao) {
    return WeatherModelApp2(
      placeName: mao["name"],
      description: mao["weather"][0]["description"],
      temp: mao["main"]["temp"],
      pressure: mao["main"]["pressure"],
      humidity: mao["main"]["humidity"],
    );
  }
}

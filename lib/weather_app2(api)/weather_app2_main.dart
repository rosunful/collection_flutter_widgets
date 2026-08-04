import 'package:collection_of_widgets/weather_app2(api)/screen/weather_app2_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppWeather2());
}

class MyAppWeather2 extends StatelessWidget {
  const MyAppWeather2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      themeMode: ThemeMode.system,
      home: const MyApp2(),
      color: Colors.green,
    );
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2();
}

class _MyApp2 extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreen2());
  }
}

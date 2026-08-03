import 'package:collection_of_widgets/weather_app(api)/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      themeMode: ThemeMode.system,
      home: const Power(),
    );
  }
}

class Power extends StatefulWidget {
  const Power({super.key});

  @override
  State<Power> createState() => _Power();
}

class _Power extends State<Power> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

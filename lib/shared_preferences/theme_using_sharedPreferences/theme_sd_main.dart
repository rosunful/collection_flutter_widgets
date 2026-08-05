import 'package:flutter/material.dart' hide Theme;
import 'package:collection_of_widgets/shared_preferences/theme_using_sharedPreferences/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    setThemeFromSharedPreferences();
  }

  void setThemeFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isDark = prefs.getBool("isDarkMode") ?? false;
    });
  }

  Future<void> setThemeMode(bool newValue) async {
    setState(() {
      isDark = newValue;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newValue);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.lightTheme,
      darkTheme: Theme.darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Home(themeSet: isDark, onChanged: setThemeMode),
    );
  }
}

// ignore: must_be_immutable
class Home extends StatefulWidget {
  final bool themeSet;
  final ValueChanged<bool> onChanged;

  Home({super.key, required this.themeSet, required this.onChanged});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello world")),
      body: Column(
        children: [
          Text("Do you want to change the theme using the shared preferences"),

          Switch(
            value: widget.themeSet,
            onChanged: (bool newValueSet) {
              setState(() {
                widget.onChanged(newValueSet);
              });
            },
          ),
        ],
      ),
    );
  }
}

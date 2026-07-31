import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0E1A14),
        fontFamily: 'Poppins',
      ),
      home: const Beginning(),
    );
  }
}

class Beginning extends StatefulWidget {
  const Beginning({super.key});
  @override
  State<Beginning> createState() => _Beginning();
}

class _Beginning extends State<Beginning> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Center(
            child: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Text('Activity', style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Text('Analytics', style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Text('Profile', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF34D399),
        ),
        child: IconButton(
          icon: const Icon(Icons.add, color: Colors.black),
          onPressed: () {
            print('Add button tapped');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() => selectedIndex = 0);
              },
              child: const Icon(Icons.home_rounded, color: Colors.white),
            ),

            GestureDetector(
              onTap: () {
                setState(() => selectedIndex = 1);
              },
              child: const Icon(Icons.receipt_long_rounded, color: Colors.grey),
            ),

            const SizedBox(width: 56),
            GestureDetector(
              onTap: () {
                setState(() => selectedIndex = 2);
              },
              child: const Icon(Icons.bar_chart_rounded, color: Colors.grey),
            ),

            GestureDetector(
              onTap: () {
                setState(() => selectedIndex = 3);
              },
              child: const Icon(Icons.person_rounded, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

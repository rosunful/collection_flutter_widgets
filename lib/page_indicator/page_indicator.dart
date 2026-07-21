import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  PageController _control = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                _control.jumpToPage(4);
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _control,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Container(color: Colors.amberAccent),
                  Container(color: Colors.green),
                  Container(color: Colors.black),
                  Container(color: Colors.white),

                  Container(color: Colors.amberAccent),
                ],
              ),
            ),
            SizedBox(height: 20),

            SmoothPageIndicator(
              controller: _control,
              count: 5,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.white,
                dotColor: Colors.white24,
                spacing: 8,
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: () {
                        _control.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text("Back"),
                    )
                  else
                    const SizedBox(width: 60),

                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == 4) {
                        debugPrint("Finished");
                      } else {
                        _control.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(_currentPage == 4 ? "Get Started" : "Next"),
                  ),
                ],
              ),
            ),

            Text('$_currentPage', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

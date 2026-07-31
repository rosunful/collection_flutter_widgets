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
  //THIS CONTROLLER HELP TO TRACK WHICH PAGE ARE WE ON (THIS IS THE CONTROLLER OF -PAGE INDICATOR AND SMOOTH PAGE INDICATOR)
  PageController _control = PageController();
  //THIS HELP TO TRACK THE WHERE ARE WE AND CAN USE THIS VARIABLE TO SHOW IN THE TEXT WHERE INDEX OF PAGE WE ARE !!
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [

            //THIS HELP US TO JUMP TO THE LAST PAGE 
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
                  //THIS HELP US TO UNDERSTAND THE PAGE HAS BEEN CHANGED OR 
                  //NOT IF CHANGED THE _currentPAGE GET UPDATED 
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

            // THIS WIDGETS HELP TO SHOW THE PAGE INDICATOR IN ANIMATION
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

                  //THIS IF FUNCTION HELPS US TO SHOW ONLY 
                  //THE BACK BUTTON IF THE PAGE LIES ON PAGE TWO 
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

                        //HERE TO APPLY TO TAKE US TO NEW LANGING PAGE
                        //HERE WE NEED TO APPLY THE NEW LOGIC LIKE NAVIAGATION POP
                        debugPrint("Finished");
                      } else {

                        //THIS BUTTON IS TO TAKE US TO NEXT PAGE 
                        _control.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },

                    //THIS HELP US TO SHOW WHICH TEXT TO SHOW IN THE BUTTON IF 
                    //THE LAST PAGE THEN SHOW "GET STARTED " OR SHOW THE "NEXT" TYPE SHIT TEXT
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

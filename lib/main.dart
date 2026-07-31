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

      themeMode: ThemeMode.system,
      home: const Power(),
    );
  }
}

class Power extends StatelessWidget {
  const Power({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                //THIS IS THE PART OF THE GOOD MORNING ROW AND THE THEME CHANGED ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //THIS IS FOR THE GOOD MORNING
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Good Evening"), Text("Roshan Gunadey")],
                    ),

                    Row(
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text("Light")),
                        Container(
                          color: Colors.white,
                          child: Center(
                            child: Icon(Icons.radio_button_on_outlined),
                          ),
                        ),
                      ],
                    ),

                    //THIS IS THE AREA OF THE THEME CHANGING AREA
                  ],

                  //THIS IS THE AREA OF THE CARD
                ),

                //THIS IS THE AREA OF THE ADD EXPENSES , ADD INCOME , TRANSFER + SCAN
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Container(
                    width: double.infinity,
                    color: Colors.greenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total baclance"),
                          Padding(
                            padding: const EdgeInsetsGeometry.symmetric(
                              vertical: 25,
                            ),
                            child: Text("12,480.50"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text("Income"), Text("\$4,250.00")],
                              ),
                              SizedBox(width: 10),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text("Expense"), Text("\$171.09")],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //THIS IS THE AREA OF THE BUDGET-FOOD & DINING
                Row(
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              child: Center(
                                child: Icon(Icons.do_not_disturb_on_sharp),
                              ),
                            ),
                            Text("Add Expenses"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(child: Center(child: Icon(Icons.add))),
                            Text("Add Income"),
                          ],
                        ),
                      ),
                    ),

                    // Container(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           child: Center(
                    //             child: Icon(Icons.do_not_disturb_on_sharp ),
                    //           ),
                    //         ),
                    //         Text("Add Expenses")
                    //       ],

                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           child: Center(
                    //             child: Icon(Icons.do_not_disturb_on_sharp ),
                    //           ),
                    //         ),
                    //         Text("Add Expenses")
                    //       ],

                    //     ),
                    //   ),
                    // ),
                  ],
                ),

                //THIS IS THE AREA OF THE EMERGENCY FUND GOAL
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    color: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Budget - Food & Dining"),
                              Text("\$340 / \$500"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 6,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Emergency Fund Goal"),
                            Text("\$2,100 of \$5,000 saved"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //THIS IS THE AREA OF THE RECENT TRANSACTION + SEE ALL BUTTON
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Recent Transactions"), Text("Sell all")],
                  ),
                ),

                //THIS IS THE PART OF THE MONEY SPEND HISTORY LISTS
                Container(
                  // color: Colors.green,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //ICON
                                Container(child: Icon(Icons.person)),

                                //MIDDLE TEXT PART
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Whole Foods Market"),
                                    Text("Food - Today"),
                                  ],
                                ),
                              ],
                            ),

                            //AMOUNT OF USER
                            Text("-\$64.20"),
                          ],
                        ),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //ICON
                                Container(child: Icon(Icons.person)),

                                //MIDDLE TEXT PART
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Whole Foods Market"),
                                    Text("Food - Today"),
                                  ],
                                ),
                              ],
                            ),

                            //AMOUNT OF USER
                            Text("-\$64.20"),
                          ],
                        ),


                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //ICON
                                Container(child: Icon(Icons.person)),

                                //MIDDLE TEXT PART
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Whole Foods Market"),
                                    Text("Food - Today"),
                                  ],
                                ),
                              ],
                            ),

                            //AMOUNT OF USER
                            Text("-\$64.20"),
                          ],
                        ),


                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //ICON
                                Container(child: Icon(Icons.person)),

                                //MIDDLE TEXT PART
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Whole Foods Market"),
                                    Text("Food - Today"),
                                  ],
                                ),
                              ],
                            ),

                            //AMOUNT OF USER
                            Text("-\$64.20"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  
  
  }
}

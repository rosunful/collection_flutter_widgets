import 'package:flutter/material.dart';
import 'dart:convert';


void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {


  Peha obj = Peha(name: "bekkar", rate: 20);

  String jsonn = '{"json_name":"bekkar","json_rate":20,"json_price":20.0}';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            ElevatedButton(onPressed: () {

              Map<String, dynamic> encoded = obj.toMap();

              var jsonString = jsonEncode(encoded);

              print(encoded);

              print(jsonString);

              
            }, child: Text("encoding")),

            ElevatedButton(onPressed: () {

              Map<String, dynamic> parsedMap = jsonDecode(jsonn);

              Peha objj = Peha.fromMap(parsedMap);

              print(objj.name);

              print(parsedMap);
              
            }, child: Text("decoding"))
          ],
        ),
      ),
    );
  }
}

class Peha {
  String name;
  int rate;
  double price;

  Peha({required this.name, required this.rate, this.price = 20.00});

  //OBJ TO JSON
  Map<String, dynamic> toMap() {
    return {"json_name": name, "json_rate": rate, "json_price": price};
  }

  //JSON TO OBJ
  factory Peha.fromMap(Map<String, dynamic> map) {
    return Peha(
      name: map['json_name'],
      rate: map['json_rate'],
      price: map['json_price'],
    );
  }
}

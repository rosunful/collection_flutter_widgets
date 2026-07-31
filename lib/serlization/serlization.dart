import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); // Fixed state name convention
}

class _HomeState extends State<Home> {
  List<String> names = [
    "Luffy",
    "Gyaan",
    "Suzuka",
    "Perman",
    "Nobita",
    "Sisimanu",
  ];

  // FIXED: Removed the trailing comma after 6.7 to prevent decoding crashes
  String objToJson = '''{
  "fullName": "duru",
  "age": 21,
  "married": false,
  "height": 6.7
}''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // Added Center for clean visual presentation
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  deserialize();
                },
                child: const Text("Json Decode"),
              ),
              const SizedBox(width: 20), // Added spacing between buttons
              ElevatedButton(
                onPressed: () {
                  serialize();
                },
                child: const Text("Json Encode"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserModel {
  final String id;
  final String fullName;
  final String email;

  UserModel({required this.id, required this.fullName, required this.email});

  // Convert Object to Map (for Serialization)
  Map toMap() {
    return {'id': id, 'fullName': fullName, 'email': email};
  }

  // Convert Map to Object (for Deserialization)
  factory UserModel.fromMap(Map map) {
    return UserModel(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

// Serialization (Object -> Map -> JSON String)
void serialize() {
  UserModel user = UserModel(
    id: '01',
    fullName: 'Rohit Semriwal',
    email: 'rohit@gmail.com',
  );

  Map userMap = user.toMap();
  String jsonString = jsonEncode(userMap);
  print(
    jsonString,
  ); // Output: {"id":"01","fullName":"Rohit Semriwal","email":"rohit@gmail.com"}
}

// Deserialization (JSON String -> Map -> Object)
void deserialize() {
  String jsonString =
      '{"id":"01","fullName":"Rohit Semriwal","email":"rohit@gmail.com"}';

  Map decodedMap = jsonDecode(jsonString);
  UserModel user = UserModel.fromMap(decodedMap);
  print(user.fullName); // Output: Rohit Semriwal
}

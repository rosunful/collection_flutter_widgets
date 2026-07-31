import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Serialization (Object -> Map -> JSON String)
  void serialize() {
    UserModel user = UserModel(
      id: '01',
      fullName: 'Rohit Semriwal',
      email: 'rohit@gmail.com',
    );

    Map userMap = user.toMap();
    String jsonString = jsonEncode(userMap);
    print(jsonString);
  }

  // Deserialization (JSON String -> Map -> Object)
  void deserialize() {
    String jsonString =
        '{"id":"01","fullName":"Rohit Semriwal","email":"rohit@gmail.com"}';

    Map decodedMap = jsonDecode(jsonString);
    UserModel user = UserModel.fromMap(decodedMap);
    print(user.fullName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  deserialize();
                },
                child: const Text("Json Decode"),
              ),
              const SizedBox(width: 20),
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

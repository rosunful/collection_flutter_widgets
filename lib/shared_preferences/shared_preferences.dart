// import 'package:collection_of_widgets/shared_preferences/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Home());
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _Home();
// }

// class _Home extends State<Home> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController addressController = TextEditingController();

//   dynamic notifymssg;

//   void submit() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();

//     pref.setString("name", nameController.text.toString());
//     pref.setInt("age", int.parse(ageController.text));
//     pref.setString("address", addressController.text.toString());

//     print("stored sucessfully ");

//     setState(() {
//       nameController.clear();
//       ageController.clear();
//       addressController.clear();

//       notifymssg = "user data has been stored";
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("$notifymssg"),
//           duration: Duration(seconds: 2), // How long it stays on screen
//         ),
//       );
//     });
//   }

//   void fetch() async {
//     SharedPreferences fetchPref = await SharedPreferences.getInstance();

//     dynamic getName = fetchPref.getString("name");
//     dynamic getAge = fetchPref.getInt("age");
//     dynamic getAddress = fetchPref.getString("address");

//     print("$getName + $getAge + $getAddress");

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("$getName + $getAge + $getAddress"),
//         duration: Duration(seconds: 2), // How long it stays on screen
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         spacing: 20,
//         children: [
//           Textfields(any: nameController),
//           Textfields(any: ageController),
//           Textfields(any: addressController),

//           Btn(method: submit, name: "store"),

//           Btn(method: fetch, name: "fetchData"),
//         ],
//       ),
//     );
//   }
// }




// ///professional way approach 


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Note: Keeping your custom widget imports as-is
import 'package:collection_of_widgets/shared_preferences/textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); // Standard Flutter naming convention
}

class _HomeState extends State<Home> {
  // Explicitly typing controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // PROFESSIONAL RULE 1: Always clean up controllers to prevent memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // Helper method to easily show snackbars without breaking async rules
  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return; // Ensures the screen is still active before showing UI
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void submit() async {
    // PROFESSIONAL RULE 2: Validate inputs before saving to prevent crashes
    final String name = _nameController.text.trim();
    final String ageText = _ageController.text.trim();
    final String address = _addressController.text.trim();

    if (name.isEmpty || ageText.isEmpty || address.isEmpty) {
      _showSnackBar("Please fill in all fields", isError: true);
      return;
    }

    final int? age = int.tryParse(ageText);
    if (age == null) {
      _showSnackBar("Please enter a valid number for age", isError: true);
      return;
    }

    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("name", name);
      await pref.setInt("age", age);
      await pref.setString("address", address);

      // PROFESSIONAL RULE 3: Clear controllers cleanly outside or inside setState
      _nameController.clear();
      _ageController.clear();
      _addressController.clear();

      _showSnackBar("User data has been stored successfully!");
    } catch (e) {
      _showSnackBar("Failed to save data: $e", isError: true);
    }
  }

  void fetch() async {
    try {
      final SharedPreferences fetchPref = await SharedPreferences.getInstance();

      // PROFESSIONAL RULE 4: Handle cases where data doesn't exist yet (null safety)
      final String name = fetchPref.getString("name") ?? "No Name";
      final int age = fetchPref.getInt("age") ?? 0;
      final String address = fetchPref.getString("address") ?? "No Address";

      _showSnackBar("Fetched: $name, Age: $age, Address: $address");
    } catch (e) {
      _showSnackBar("Failed to fetch data", isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Prevents UI from overlapping with phone notches/status bars
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center, // Centers elements nicely
            children: [
              Textfields(any: _nameController),
              const SizedBox(height: 20), // Standard spacing mechanism in Flutter
              Textfields(any: _ageController),
              const SizedBox(height: 20),
              Textfields(any: _addressController),
              const SizedBox(height: 20),
              Btn(method: submit, name: "Store Data"),
              const SizedBox(height: 10),
              Btn(method: fetch, name: "Fetch Data"),
            ],
          ),
        ),
      ),
    );
  }
}

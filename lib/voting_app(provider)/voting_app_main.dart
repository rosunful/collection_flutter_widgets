import 'package:collection_of_widgets/voting_app(provider)/voting_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ChangeNotifierProvider<VotingNotifier>(
            create: (context) => VotingNotifier(),
            child: Consumer<VotingNotifier>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //for information of eligible or not
                    Text(
                      provider.eligibilityMessage.toString(),
                      style: TextStyle(
                        color: provider.isEligibility == true
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),

                    //for the input data
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (getValue) {
                        dynamic age = int.tryParse(getValue);
                        if (age != null) {
                          provider.check(int.parse(getValue));
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

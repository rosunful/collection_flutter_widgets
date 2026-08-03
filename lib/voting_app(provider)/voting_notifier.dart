import 'package:flutter/material.dart';

class VotingNotifier extends ChangeNotifier {
  bool? isEligibility; // true or false
  String? eligibilityMessage;

  void check(int age) {
    // if he < 18 then no
    if (age >= 18) {
      eligibilityMessage = " you are eligible for voting";
      isEligibility = true;
      notifyListeners();
    }
    // but he > 18 yes
    else {
      eligibilityMessage = "you are not eligibile for voting";
      isEligibility = false;

      notifyListeners();
    }
  }
}

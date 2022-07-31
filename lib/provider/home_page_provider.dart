import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier{

  bool? isEligible;
  String? eligibilityMessage = "";

  void checkEligibility (int age){

    if(age>18){
      isEligible = true;
      eligibilityMessage = "You are eligible for the licence!";
      notifyListeners();
    }

    else if(age<18){
      isEligible = false;
      eligibilityMessage = "You are not eligible for the licence!";
      notifyListeners();
    }

  }

}
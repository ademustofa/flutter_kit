import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier{
  String fullname = "";
  String noHp = "";

  void setProfiles (){
    fullname = "Ade Mustofa";
    noHp = "082118773143";

    notifyListeners();
  }
  
}
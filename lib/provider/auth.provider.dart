import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  bool isLoggin = false;
  String token = '';

  void setIsLogged (){
    isLoggin = true;
    token = "ASLDJALSJDJALJDLAJ";

    notifyListeners();
  }
  
}
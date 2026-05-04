import 'package:flutter/material.dart';

class Userdata extends ChangeNotifier{

  String _name = "";

  String get Username => _name;

  void Setname (String name){
    _name = name;
    notifyListeners();
  }

}
import 'package:dramaskin/Questions/SkinRes.dart';
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {

  String _name = "";
  String _email = "";
  String _password = "";
  SkinType _skinType = SkinType.NORMAL;
  Set<String> _skinConcerns = {};
  String _gender = "";

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  SkinType get skinType => _skinType;
  String get gender => _gender;
  Set<String> get skinConcerns => _skinConcerns;

  // Methods
  void setPersonalInfo(String name, String email, String password) {
    _name = name;
    _email = email;
    _password = password;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void setSkinType(SkinType value) {
    _skinType = value;
    notifyListeners();
  }

  void setSkinConcerns(Set<String> value) {
    _skinConcerns = value;
    notifyListeners();
  }
}
import 'package:dramaskin/Questions/SkinRes.dart';
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _name = "";
  String _email = "";
  String _password = "";
  SkinType _skinType = SkinType.NORMAL;
  Set<String> _skinConcerns = {};
  String _gender = "";
  bool _active = false;

  int _score = 0;

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  SkinType get skinType => _skinType;
  String get gender => _gender;
  Set<String> get skinConcerns => _skinConcerns;
  bool get active => _active;
  int get score => _score;

  void setPersonalInfo(String name, String email, String password) {
    _name = name;
    _email = email;
    _password = password;
    _active = true;
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

  // ✅ SCORE CALCULATION (Morning + Night)
  void calculateRoutineScore({
    required int morningTotal,
    required int morningDone,
    required int nightTotal,
    required int nightDone,
  }) {
    int total = morningTotal + nightTotal;
    int done = morningDone + nightDone;

    _score = total == 0 ? 0 : ((done / total) * 100).round();

    notifyListeners();
  }

  void logout() {
    _active = false;
    notifyListeners();
  }
}
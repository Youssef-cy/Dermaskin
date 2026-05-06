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

  double _morningScore = 0.0;
  double _nightScore = 0.0;

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  SkinType get skinType => _skinType;
  String get gender => _gender;
  Set<String> get skinConcerns => _skinConcerns;
  bool get active => _active;

  double get morningScore => _morningScore;
  double get nightScore => _nightScore;

  int get score => ((_morningScore + _nightScore) / 2 * 100).round();

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

  // ✅ UPDATED
  void calculateRoutineScore({
    required int morningTotal,
    required int morningDone,
    required int nightTotal,
    required int nightDone,
  }) {
    if (morningTotal > 0) {
      _morningScore = morningDone / morningTotal;
    }

    if (nightTotal > 0) {
      _nightScore = nightDone / nightTotal;
    }

    notifyListeners();
  }

  void logout() {
    _active = false;
    _morningScore = 0;
    _nightScore = 0;
    notifyListeners();
  }
}
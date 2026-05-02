import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  TextEditingController uesrnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

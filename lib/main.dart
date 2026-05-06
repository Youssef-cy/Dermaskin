import 'package:dramaskin/Provider/products.dart';
import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>UserData()),
      ChangeNotifierProvider(create: (context)=>products()),
    ],
    child: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: SplashScreen(),);
  }
}

import 'package:dramaskin/Home/Widgets/MainScreen.dart';
import 'package:dramaskin/shared/appColors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'Widgets/Drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.bgColor,
      drawer: AppDrawer(),
      body:MainScreen()
    );
  }
}



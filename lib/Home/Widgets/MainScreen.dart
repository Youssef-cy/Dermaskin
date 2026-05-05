import 'package:flutter/material.dart';

import 'CircularProgress.dart';
import 'DailyProgressCard.dart';
import 'RoutineCard.dart';
import 'greetingSection.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP BAR

            // GREETING
            GreetingSection(),

            SizedBox(height: 20),
            SizedBox(height: 20),

            // DAILY PROGRESS
            DailyProgressCard(),

            SizedBox(height: 80),

            Center(
              child: RoutineCard(
                label: "morning",
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFF8C69), Color(0xFFFFB347)],
                ),
                image: "assets/sun.jpg",

                rightWidget: CircularProgress(
                  percent: 0.5,
                  label: "50%",
                  color: Color(0xFF7B68EE),
                ),
              ),
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgress(
                  percent: 0.5,
                  label: "15%",
                  color: Color(0xFF7B68EE),
                ),

                const SizedBox(width: 80),

                RoutineCard(
                  label: "night",
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF7B68EE), Color(0xFF4B3FA0)],
                  ),
                  image:"assets/moon.png",
                ),
              ],
            ),

            // NIGHT + PROGRESS
          ],
        ),
      ),
    );
  }
}

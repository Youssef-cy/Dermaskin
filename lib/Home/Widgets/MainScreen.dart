import 'package:dramaskin/RoutineStep/morningRoutineStep.dart';
import 'package:dramaskin/RoutineStep/nightRoutineStep.dart' hide MorningRoutineScreen;
import 'package:dramaskin/auth/Profile.dart';
import 'package:dramaskin/Provider/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CircularProgress.dart';
import 'DailyProgressCard.dart';
import 'Drawer.dart';
import 'RoutineCard.dart';
import 'SkinRow.dart';
import 'greetingSection.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),
      drawer: AppDrawer(),

      body: SafeArea(
        child: Consumer<UserData>( // ✅ أهم تعديل
          builder: (context, userData, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // APP BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (ctx) => GestureDetector(
                          onTap: () => Scaffold.of(ctx).openDrawer(),
                          child: const Icon(Icons.menu, size: 26),
                        ),
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFE8A0C0),
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => ProfilePage()),
                              );
                            },
                            child: Image.network(
                              'https://i.pravatar.cc/150?img=47',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.person,
                                size: 20,
                                color: Color(0xFFE8A0C0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const GreetingSection(),

                  const SizedBox(height: 40),

                  const DailyProgressCard(),

                  const SizedBox(height: 54),

                  // 🌞 MORNING
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MorningRoutineScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const RoutineCard(
                            label: "Morning",
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFFF8C69),
                                Color(0xFFFFB347)
                              ],
                            ),
                            image: "assets/sun.jpg",
                          ),

                          const SizedBox(width: 80),

                          CircularProgress(
                            percent: userData.morningScore, // ✅ dynamic
                            label:
                            "${(userData.morningScore * 100).round()}%",
                            color: const Color(0xFF7B68EE),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🌙 NIGHT
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NightRoutineScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          CircularProgress(
                            percent: userData.nightScore, // ✅ dynamic
                            label:
                            "${(userData.nightScore * 100).round()}%",
                            color: const Color(0xFF7B68EE),
                          ),

                          const SizedBox(width: 80),

                          const RoutineCard(
                            label: "Night",
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF9B8FEE),
                                Color(0xFF6B5FD0)
                              ],
                            ),
                            image: "assets/moon.png",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 88),

                  SkinSummaryCard(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
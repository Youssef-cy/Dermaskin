import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dramaskin/Provider/userdata.dart';

class RoutineStep {
  final String id;
  final String title;
  final String description;
  final Color color;
  bool isDone;

  RoutineStep({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    this.isDone = false,
  });
}

class MorningRoutineScreen extends StatefulWidget {
  @override
  _MorningRoutineScreenState createState() => _MorningRoutineScreenState();
}

class _MorningRoutineScreenState extends State<MorningRoutineScreen> {
  final List<RoutineStep> steps = [
    RoutineStep(id: '01', title: 'Cleanser', description: 'Gentle face wash to remove overnight oil & impurities', color: Color(0xFFFF74A4)),
    RoutineStep(id: '02', title: 'Toner', description: 'Balance skin pH and prep for the next steps', color: Color(0xFF9191FF)),
    RoutineStep(id: '03', title: 'Vitamin C Serum', description: 'Brighten and protect against free radicals', color: Color(0xFFFFD15B)),
    RoutineStep(id: '04', title: 'Eye Cream', description: 'Hydrate and reduce puffiness around the eyes', color: Color(0xFF63FFD1)),
    RoutineStep(id: '05', title: 'Moisturizer', description: 'Lock in hydration with a lightweight formula', color: Color(0xFFFF85A1)),
    RoutineStep(id: '06', title: 'Sunscreen SPF 50+', description: 'NEVER skip this — protect from UV damage daily', color: Color(0xFFB19CFF)),
  ];

  int get doneCount => steps.where((e) => e.isDone).length;

  void updateScore() {
    context.read<UserData>().calculateRoutineScore(
      morningTotal: steps.length,
      morningDone: doneCount,
      nightTotal: 0,
      nightDone: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF0F3),
      body: Stack(
        children: [

          // SAME BACKGROUND
          Positioned(top: -70, right: -70, child: _circle(Color(0xFFFFD6E8), 220)),
          Positioned(top: -30, right: -30, child: _circle(Color(0xFFE3BFFF), 110)),
          Positioned(bottom: -80, left: -80, child: _circle(Color(0xFFFFD6E8), 240)),
          Positioned(bottom: -25, left: -25, child: _circle(Color(0xFFE3BFFF), 120)),

          SafeArea(
            child: Column(
              children: [

                // BACK BUTTON (same)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new, color: Color(0xFFFF74A4), size: 18),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),

                // HEADER (same)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE4EC),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF74A4),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.wb_sunny_outlined, color: Colors.white, size: 28),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Morning Routine', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Text('Step-by-step for glowing skin', style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                        ],
                      )
                    ],
                  ),
                ),

                // LIST (same design)
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: steps.length,
                    itemBuilder: (context, index) {
                      final step = steps[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: 14),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: step.color.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Text(step.id,
                                  style: TextStyle(
                                    color: step.color,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(step.title,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text(step.description,
                                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                                ],
                              ),
                            ),
                            Checkbox(
                              value: step.isDone,
                              activeColor: step.color,
                              onChanged: (val) {
                                setState(() {
                                  step.isDone = val!;
                                });
                                updateScore();
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // BUTTON (same)
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for (var e in steps) {
                          e.isDone = true;
                        }
                      });
                      updateScore();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF74A4),
                      minimumSize: Size(250, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: Text("Mark All Done ✓"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.7)),
    );
  }
}
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

class NightRoutineScreen extends StatefulWidget {
  @override
  _NightRoutineScreenState createState() => _NightRoutineScreenState();
}

class _NightRoutineScreenState extends State<NightRoutineScreen> {
  final List<RoutineStep> steps = [
    RoutineStep(id: '01', title: 'Makeup Remover / Micellar Water', description: 'Break down makeup', color: Color(0xFFFF74A4)),
    RoutineStep(id: '02', title: 'Oil Cleanser', description: 'Double cleanse', color: Color(0xFF9191FF)),
    RoutineStep(id: '03', title: 'Gentle Cleanser', description: 'Deep cleanse pores', color: Color(0xFFFF74A4)),
    RoutineStep(id: '04', title: 'Toner / Essence', description: 'Hydration prep', color: Color(0xFF63FFD1)),
    RoutineStep(id: '05', title: 'Treatment / Retinol', description: 'Skin repair', color: Color(0xFF9191FF)),
    RoutineStep(id: '06', title: 'Eye Cream', description: 'Eye care', color: Color(0xFFB19CFF)),
    RoutineStep(id: '07', title: 'Night Moisturizer', description: 'Overnight hydration', color: Color(0xFFFF85A1)),
  ];

  int get doneCount => steps.where((e) => e.isDone).length;

  void updateScore() {
    context.read<UserData>().calculateRoutineScore(
      morningTotal: 0,
      morningDone: 0,
      nightTotal: steps.length,
      nightDone: doneCount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EEFF),
      body: Stack(
        children: [

          Positioned(top: -70, right: -70, child: _circle(Color(0xFFD8D0FF), 220)),
          Positioned(top: -30, right: -30, child: _circle(Color(0xFFBFAFFF), 110)),
          Positioned(bottom: -80, left: -80, child: _circle(Color(0xFFD8D0FF), 240)),
          Positioned(bottom: -25, left: -25, child: _circle(Color(0xFFBFAFFF), 120)),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.deepPurple, blurRadius: 10)],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new, color:Colors.black, size: 18),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xFFE4DFFF),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFF7B68EE),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.nightlight_round, color: Colors.white),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Night Routine", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Text("Repair and restore while you sleep"),
                        ],
                      )
                    ],
                  ),
                ),

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
                              child: Text(step.id),
                            ),
                            SizedBox(width: 15),
                            Expanded(child: Text(step.title)),
                            Checkbox(
                              value: step.isDone,
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

                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for (var e in steps) {
                          e.isDone = true;
                        }
                      });
                      updateScore();
                    },
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
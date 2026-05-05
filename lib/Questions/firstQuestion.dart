import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/Questions/skin_concerns.dart';
import 'package:dramaskin/shared/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Questions.dart';
import 'SkinRes.dart';


class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int _currentQuestion = 0;
  int? _selectedOption;

  late double size = MediaQuery.of(context).size.width * 0.25;
  void _onBack() {
    if (_currentQuestion > 0) {
      setState(() {
        _currentQuestion--;
        _selectedOption = null;
      });
    }
  }

  void _onNext() {
    if (_selectedOption == null) return;

    SkinScore.addAnswer(_currentQuestion, _selectedOption!);

    if (_currentQuestion < questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedOption = null;
      });
    } else {
      SkinType result = SkinScore.getResult();
      Provider.of<UserData>(context,listen: false).setSkinType(result);
      SkinScore.reset(); // مهم عشان لو المستخدم بدأ تاني

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SkinConcernsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[_currentQuestion];
    final progress = (_currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: appColors.bgColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                color: appColors.topColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120),
                ),
              ),
            ),
          ),

          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${_currentQuestion + 1}/${questions.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          Positioned(
            top: 150,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appColors.cardBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                q.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Positioned(
            top: 400,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: buildOption(q.options[0], 0)),
                    const SizedBox(width: 10),
                    Expanded(child: buildOption(q.options[1], 1)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(child: buildOption(q.options[2], 2)),
                    const SizedBox(width: 10),
                    Expanded(child: buildOption(q.options[3], 3)),
                  ],
                ),
              ],
            ),
          ),


          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              children: [
                if (_currentQuestion > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onBack,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColors.buttonColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                      ),
                      child: const Text(
                        "Back",
                        style: TextStyle(color: appColors.TextColor),
                      ),
                    ),
                  ),

                if (_currentQuestion > 0) const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: _onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.buttonColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(color: appColors.TextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption(String text, int index) {
    bool isSelected = _selectedOption == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedOption = index),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: isSelected ? appColors.selectedOptionBg : appColors.optionBg,
          borderRadius: BorderRadius.circular(15),
          border: isSelected
              ? Border.all(color: appColors.buttonColor, width: 2)
              : null,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}

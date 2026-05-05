import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/Questions/firstQuestion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkinSummaryCard extends StatelessWidget {
  const SkinSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Skin Summary',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF555555),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _row('Skin Type :', '${Provider.of<UserData>(context).skinType}'),
              const SizedBox(height: 6),
              _row('Concerns :', '${Provider.of<UserData>(context).skinConcerns}'),
              const SizedBox(height: 6),
              _row('Gender :', '${Provider.of<UserData>(context).gender}'),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE05580),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionnaireScreen()));
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

    );
  }

  Widget _row(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 95,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
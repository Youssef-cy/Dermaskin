import 'package:flutter/material.dart';

class DailyProgressCard extends StatelessWidget {
  const DailyProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            'Daily Routine',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: 0.5,
                minHeight: 10,
                backgroundColor: const Color(0xFFE8E0FF),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7B68EE)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
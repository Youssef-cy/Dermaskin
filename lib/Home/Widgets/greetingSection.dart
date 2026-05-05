import 'package:dramaskin/Provider/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning,\n${Provider.of<UserData>(context).name}',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 16),
        Text(
          "Let's keep your skin glowing!",
          style: TextStyle(fontSize: 14, color: Color(0xFF888888)),
        ),
      ],
    );
  }
}
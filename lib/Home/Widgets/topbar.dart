import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final VoidCallback onMenuTap;

  const TopBar({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onMenuTap,
          child: const Icon(Icons.menu),
        ),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFFE8A0C0), width: 2),
          ),
          child: ClipOval(
            child: Image.network(
              'https://i.pravatar.cc/150?img=47',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
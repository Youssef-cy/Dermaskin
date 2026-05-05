import 'package:flutter/material.dart';

class RoutineCard extends StatelessWidget {
  final String label;
  final LinearGradient gradient;
  final String image;
  final Widget? rightWidget;
  final VoidCallback? onTap;

  const RoutineCard({
    super.key,
    required this.label,
    required this.gradient,
    required this.image,
    this.rightWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 160,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: gradient.colors.last.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(child: Transform.scale(scale: 0.85, child: Image.asset("$image"))),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (rightWidget != null) ...[const SizedBox(width: 80), rightWidget!],
        ],
      ),
    );
  }
}

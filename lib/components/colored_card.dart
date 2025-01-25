import 'package:flutter/material.dart';

class ColoredCard extends StatelessWidget {
  final bool isActive;
  final Color color;

  const ColoredCard({Key? key, required this.isActive, required this.color})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 40),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(0, isActive ? -40.0 : 0.0, 0),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
    );
  }
}

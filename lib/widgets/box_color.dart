import 'package:flutter/material.dart';

class BoxColor extends StatelessWidget {
  final Color color;

  const BoxColor({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
    );
  }
}

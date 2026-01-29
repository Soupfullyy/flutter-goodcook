import 'package:flutter/material.dart';

class CustomInk extends StatelessWidget {
  final double radius;
  final IconData icon;
  const CustomInk({super.key, this.radius = 6, this.icon = Icons.add});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 40,
      height: 40,
      decoration: const ShapeDecoration(
          color: Color(0xFFA5FFC5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)))),
      child: IconButton(
          onPressed: () => (), icon: Icon(icon)),
    );
  }
}
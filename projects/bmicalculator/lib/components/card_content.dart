import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CardContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const CardContent({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(
          height: 15.0,
        ),
        Text(
            label,
            style: labelTextStyle
        ),
      ],
    );
  }
}
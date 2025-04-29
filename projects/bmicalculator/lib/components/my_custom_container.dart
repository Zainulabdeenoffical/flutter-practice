import 'package:flutter/material.dart';

class MyCustomContainer extends StatelessWidget {
  final Color containerColor;
  final Widget cardChild;
  const MyCustomContainer({
    super.key,
    required this.containerColor,
    required this.cardChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

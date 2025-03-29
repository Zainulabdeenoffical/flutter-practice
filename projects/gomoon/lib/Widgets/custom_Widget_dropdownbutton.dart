import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> values;
  final double width;

  const CustomDropdownButton({Key? key, required this.values, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: values.isNotEmpty ? values.first : null, // Avoid crash if list is empty
        onChanged: (_) {},
        items: values.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e, style: const TextStyle(color: Colors.white)),
          );
        }).toList(),
        underline: Container(),
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
      ),
    );
  }
}


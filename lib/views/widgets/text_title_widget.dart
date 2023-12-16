import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String text;
  const TextTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'TitleFontFamily',
          fontWeight: FontWeight.bold),
    );
  }
}

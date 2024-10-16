import 'package:flutter/material.dart';
import 'package:todo/shared/styles/color_app.dart';

// ignore: must_be_immutable
class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({
    super.key,
    required this.text,
    required this.function,
    required this.fontSize,
  });

  final String text;
  final double fontSize;
  void Function() function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: primaryColor,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

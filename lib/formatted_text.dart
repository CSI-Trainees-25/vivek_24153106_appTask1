import 'package:flutter/material.dart';

class FormattedText extends StatelessWidget {
  const FormattedText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.white, fontSize: 14));
  }
}

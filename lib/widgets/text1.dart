import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isBold;
  const Text1(
      {super.key, required this.text, this.fontSize = 18, this.isBold = true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).primaryTextTheme.bodyText1?.color,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
    );
  }
}

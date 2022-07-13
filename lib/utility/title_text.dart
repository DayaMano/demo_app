import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 25),
    );
  }
}

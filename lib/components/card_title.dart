import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String text;

  const CardTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 0.5,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class Disclaimer extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;

  const Disclaimer({Key? key, required this.text, this.weight = FontWeight.w600, this.size = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}

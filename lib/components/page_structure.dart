import 'package:flutter/material.dart';

class PageStructure extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? leading;

  const PageStructure({
    Key? key,
    required this.body,
    required this.title,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        titleSpacing: 0,
        backgroundColor: Colors.black,
        leading: leading,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: body,
      ),
    );
  }
}

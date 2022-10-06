import 'package:flutter/material.dart';
import 'package:practice_maniac/components/rounded_box.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({
    Key? key,
    required this.onTap,
    required this.color,
    required this.children,
  }) : super(key: key);

  final void Function() onTap;
  final Color color;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: RoundedBox(
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

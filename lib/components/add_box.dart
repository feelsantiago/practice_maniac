import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddBox extends StatelessWidget {
  final void Function() onTap;

  const AddBox({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [10, 10],
          color: Colors.grey,
          strokeWidth: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

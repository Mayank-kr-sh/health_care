import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class Dotbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final svg;
  const Dotbutton({
    super.key,
    required this.text,
    required this.onPressed,
    this.svg,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          height: 50,
          width: 320,
          // color: Colors.amber,
          child: DottedBorder(
              borderType: BorderType.RRect,
              strokeWidth: 2,
              dashPattern: const [2, 6], // [dot radius, spacing]
              color: kPrimaryColor,
              radius: const Radius.circular(8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_circle, color: kPrimaryColor),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(text),
                  ],
                ),
              ))),
    );
  }
}

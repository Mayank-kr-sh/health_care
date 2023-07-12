import 'package:flutter/material.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSelected;
  final Function() onPressed;

  const ColorButton({
    Key? key,
    required this.color,
    required this.text,
    this.isSelected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? kPrimaryColor : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: isSelected ? kPrimaryColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

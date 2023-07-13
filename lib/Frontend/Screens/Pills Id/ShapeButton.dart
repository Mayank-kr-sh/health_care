import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class ShapeButton extends StatelessWidget {
  final String svgPath;
  final String text;
  final bool isSelected;
  final Function() onPressed;

  const ShapeButton({
    Key? key,
    required this.svgPath,
    required this.text,
    this.isSelected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent,
              width: isSelected ? 2.0 : 0.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                width: 55,
                height: 55,
                // ignore: deprecated_member_use
                color: isSelected ? kPrimaryColor : Colors.grey[300],
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: isSelected ? kPrimaryColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

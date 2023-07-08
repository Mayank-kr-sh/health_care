import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  const CardWidget({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth =
        screenWidth * 0.3; // Adjust the width percentage as needed

    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: cardWidth * 1.5,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: cardWidth * 0.15, // Adjust the icon size as needed
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: cardWidth * 0.12,
                    ), // Adjust the text size as needed
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

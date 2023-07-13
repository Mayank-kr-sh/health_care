import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Pills%20Id/ColorButton.dart';

import '../../constants/constants.dart';

class ColorScreen extends StatefulWidget {
  final Function(Color) onColorSelected;
  const ColorScreen({Key? key, required this.onColorSelected})
      : super(key: key);

  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int _selectedShapeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
              child: Text(
                'Select the shape that best matches your prescription or OTC drug.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    childAspectRatio: 1.6,
                    mainAxisSpacing: 15,
                    children: List.generate(shapeColors.length, (index) {
                      final color = shapeColors[index];
                      final colorName = colorList[index];
                      return ColorButton(
                        color: color,
                        text: colorName,
                        isSelected: _selectedShapeIndex == index,
                        onPressed: () {
                          setState(() {
                            _selectedShapeIndex = index;
                          });
                          widget.onColorSelected(color);
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

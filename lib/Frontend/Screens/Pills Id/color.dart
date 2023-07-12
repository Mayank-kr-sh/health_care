import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Pills%20Id/ShapeButton.dart';

class ShapeScreen extends StatefulWidget {
  const ShapeScreen({Key? key}) : super(key: key);

  @override
  _ShapeScreenState createState() => _ShapeScreenState();
}

class _ShapeScreenState extends State<ShapeScreen> {
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
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShapeButton(
                  svgPath: 'assets/icons/oval.svg',
                  text: 'Round',
                  isSelected: _selectedShapeIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 0;
                    });
                  },
                ),
                ShapeButton(
                  svgPath: 'assets/icons/roundedrectangle.svg',
                  text: 'Oblong',
                  isSelected: _selectedShapeIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 1;
                    });
                  },
                ),
                ShapeButton(
                  svgPath: 'assets/icons/triangle.svg',
                  text: '3-sided',
                  isSelected: _selectedShapeIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 2;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShapeButton(
                  svgPath: 'assets/icons/square.svg',
                  text: 'Square',
                  isSelected: _selectedShapeIndex == 3,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 3;
                    });
                  },
                ),
                ShapeButton(
                  svgPath: 'assets/icons/rectangle.svg',
                  text: 'Rectangle',
                  isSelected: _selectedShapeIndex == 4,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 4;
                    });
                  },
                ),
                ShapeButton(
                  svgPath: 'assets/icons/diamond.svg',
                  text: 'Diamond',
                  isSelected: _selectedShapeIndex == 5,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 5;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShapeButton(
                  svgPath: 'assets/icons/pentagon.svg',
                  text: '5-sided',
                  isSelected: _selectedShapeIndex == 6,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 6;
                    });
                  },
                ),
                ShapeButton(
                  svgPath: 'assets/icons/polygon.svg',
                  text: '6-sided',
                  isSelected: _selectedShapeIndex == 7,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 7;
                    });
                  },
                ),
                ShapeButton(
                  svgPath: 'assets/icons/heptagon.svg',
                  text: '7-sided',
                  isSelected: _selectedShapeIndex == 8,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 8;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShapeButton(
                  svgPath: 'assets/icons/octagon.svg',
                  text: '8-sided',
                  isSelected: _selectedShapeIndex == 9,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 9;
                    });
                  },
                ),
                ShapeButton(
                  svgPath: 'assets/icons/Questionmark.svg',
                  text: 'Other',
                  isSelected: _selectedShapeIndex == 10,
                  onPressed: () {
                    setState(() {
                      _selectedShapeIndex = 10;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

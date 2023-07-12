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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select the shape that best matches your prescription or OTC drug.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: 'Round',
                    isSelected: _selectedShapeIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/drugs.svg',
                    text: 'Oblong',
                    isSelected: _selectedShapeIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 1;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: '3-sided',
                    isSelected: _selectedShapeIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: 'Square',
                    isSelected: _selectedShapeIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 3;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: 'Rectangle',
                    isSelected: _selectedShapeIndex == 4,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 4;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: 'Diamond',
                    isSelected: _selectedShapeIndex == 5,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 5;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: '5-sided',
                    isSelected: _selectedShapeIndex == 6,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 6;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: '6-sided',
                    isSelected: _selectedShapeIndex == 7,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 7;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: '7-sided',
                    isSelected: _selectedShapeIndex == 8,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 8;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: '8-sided',
                    isSelected: _selectedShapeIndex == 9,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 9;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ShapeButton(
                    svgPath: 'assets/icons/Questionmark.svg',
                    text: 'Other',
                    isSelected: _selectedShapeIndex == 10,
                    onPressed: () {
                      setState(() {
                        _selectedShapeIndex = 10;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Pills%20Id/ShapeButton.dart';

class ShapeScreen extends StatefulWidget {
  final Function(String) onShapeSelected;
  const ShapeScreen({Key? key, required this.onShapeSelected})
      : super(key: key);

  @override
  _ShapeScreenState createState() => _ShapeScreenState();
}

class _ShapeScreenState extends State<ShapeScreen> {
  int _selectedShapeIndex = -1;

  List<String> shapeList = [
    'Round',
    'Oblong',
    '3-sided',
    'Square',
    'Rectangle',
    'Diamond',
    '5-sided',
    '6-sided',
    '7-sided',
    '8-sided',
    'Other',
  ];

  List<String> svgList = [
    'assets/icons/oval.svg',
    'assets/icons/roundedrectangle.svg',
    'assets/icons/triangle.svg',
    'assets/icons/square.svg',
    'assets/icons/rectangle.svg',
    'assets/icons/diamond.svg',
    'assets/icons/pentagon.svg',
    'assets/icons/polygon.svg',
    'assets/icons/heptagon.svg',
    'assets/icons/octagon.svg',
    'assets/icons/Questionmark.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
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
              const SizedBox(height: 5),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 10,
                  children: List.generate(svgList.length, (index) {
                    final img = svgList[index];
                    final shapeName = shapeList[index];
                    return ShapeButton(
                      svgPath: img,
                      text: shapeName,
                      isSelected: _selectedShapeIndex == index,
                      onPressed: () {
                        setState(() {
                          _selectedShapeIndex = index;
                        });
                        widget.onShapeSelected(img);
                      },
                    );
                  }),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

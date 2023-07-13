import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Pills%20Id/ShapeButton.dart';

import '../../constants/constants.dart';

class ShapeScreen extends StatefulWidget {
  final Function(String) onShapeSelected;
  const ShapeScreen({Key? key, required this.onShapeSelected})
      : super(key: key);

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

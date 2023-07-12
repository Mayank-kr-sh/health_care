import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Pills%20Id/ColorButton.dart';

class ColorScreen extends StatefulWidget {
  final Function(Color) onColorSelected;
  const ColorScreen({Key? key, required this.onColorSelected})
      : super(key: key);

  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int _selectedShapeIndex = -1;

  List<Color> shapeColors = [
    Colors.white,
    const Color.fromARGB(255, 235, 212, 156),
    Colors.grey,
    Colors.black,
    const Color.fromARGB(255, 198, 145, 12),
    Colors.brown,
    Colors.red,
    Colors.pink,
    Colors.orange,
    const Color.fromARGB(255, 210, 168, 62),
    Colors.yellow,
    Colors.green,
    const Color.fromARGB(255, 30, 10, 209),
    Colors.purple,
    Colors.teal,
    Colors.cyanAccent,
    Colors.indigo,
    const Color.fromARGB(221, 82, 82, 82)

    // Add more colors here
  ];

  List<String> shapeList = [
    'White',
    'Off White',
    'Grey',
    'Black',
    'Tan',
    'Brown',
    'Red',
    'Pink',
    'Orange',
    'Peach',
    'Yellow',
    'Green',
    'Blue',
    'Purple',
    'Teal',
    'Turquois',
    'Indigo',
    'Other',
  ];

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
                      final shapeName = shapeList[index];
                      return ColorButton(
                        color: color,
                        text: shapeName,
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

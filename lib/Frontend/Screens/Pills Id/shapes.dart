import 'package:flutter/material.dart';

class ColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Text(
          'Shape Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

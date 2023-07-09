import 'package:flutter/material.dart';

class AppInfoDialog extends StatelessWidget {
  final VoidCallback onClose;
  const AppInfoDialog({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo1.jpg',
                width: 240,
                height: 200,
                // Adjust the width and height as needed
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'App Information',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed commodo gravida ex, ut ullamcorper eros convallis sed. '
                  'Fusce non diam elit.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 10),
                    child: TextButton(
                      onPressed: onClose,
                      child: const Text('OK'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 2.0,
            right: 1.0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: onClose,
            ),
          ),
        ],
      ),
    );
  }
}

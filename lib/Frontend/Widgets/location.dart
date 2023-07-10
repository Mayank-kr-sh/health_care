import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Location Not Enabled'),
      content: const Text(
          'Make sure you allow location access to the app in your device settings.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            openAppSettings(); // Open app settings
          },
          child: const Text('Settings'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

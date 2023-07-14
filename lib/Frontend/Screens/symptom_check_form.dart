import 'package:flutter/material.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class SymptomCheckForm extends StatelessWidget {
  const SymptomCheckForm({
    Key? key,
    required this.age,
    required this.isMaleButtonPressed,
    required this.isFemaleButtonPressed,
    required this.onAgeChanged,
    required this.onMaleButtonPressed,
    required this.onFemaleButtonPressed,
  }) : super(key: key);

  final String age;
  final bool isMaleButtonPressed;
  final bool isFemaleButtonPressed;
  final ValueChanged<String> onAgeChanged;
  final VoidCallback onMaleButtonPressed;
  final VoidCallback onFemaleButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 15),
        const Text(
          'Symptom Checker',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Text(
              'Identify possible conditions and treatment related to your symptoms',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'This tool does not provide medical advice',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () {
            // Handle additional information click
          },
          child: const Text(
            'See additional information',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        const Text('Enter Age', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          width: 60,
          child: Center(
            child: TextField(
              onChanged: onAgeChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: kPrimaryColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Select Sex', style: TextStyle(fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onMaleButtonPressed,
              style: ElevatedButton.styleFrom(
                primary: isMaleButtonPressed ? kPrimaryColor : Colors.grey,
                onPrimary: Colors.white,
              ),
              child: const Text('Male'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onFemaleButtonPressed,
              style: ElevatedButton.styleFrom(
                primary: isFemaleButtonPressed ? kPrimaryColor : Colors.grey,
                onPrimary: Colors.white,
              ),
              child: const Text('Female'),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class AddReminder extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;
  const AddReminder({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Medication Reminders',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.grey.shade300,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/drugs.svg",
                        // ignore: deprecated_member_use
                        color: kPrimaryColor,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Drug: ",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/reminder.svg",
                        color: kPrimaryColor,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Dosage',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Select Dosage',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/reminder.svg",
                        color: kPrimaryColor,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 150.0),
                  const Text(
                    '1:48 am',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
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

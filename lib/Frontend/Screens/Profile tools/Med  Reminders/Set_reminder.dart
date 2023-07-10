import 'package:flutter/material.dart';
import 'package:health_care/Frontend/buttons/Dot_button.dart';

class SetReminders extends StatefulWidget {
  const SetReminders({super.key});

  @override
  State<SetReminders> createState() => _SetRemindersState();
}

class _SetRemindersState extends State<SetReminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Removes the shadow
          title: const Text(
            'Medication Reminders',
            style: TextStyle(color: Colors.black87),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Medication Reminder",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Dotbutton(text: "Add Reminder", onPressed: () => {}),
            ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/Frontend/Screens/Profile%20tools/Med%20%20Reminders/Set_reminder.dart';

import '../../../buttons/Transparent_button.dart';
import '../../../constants/constants.dart';

class MedReminders extends StatefulWidget {
  const MedReminders({super.key});

  @override
  State<MedReminders> createState() => _MedRemindersState();
}

class _MedRemindersState extends State<MedReminders> {
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
              SvgPicture.asset(
                "assets/icons/reminder.svg",
                color: kPrimaryColor,
                width: 22,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Nothing here yet",
                  style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TransparentButton(
                    text: 'Create Reminder',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SetReminders()),
                      );
                    }),
              ),
            ]));
  }
}

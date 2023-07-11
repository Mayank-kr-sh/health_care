import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Auth/Create_profile.dart';
import 'package:health_care/Frontend/Screens/Profile%20tools/Med%20%20Reminders/Med_reminders.dart';
import 'package:health_care/Frontend/Screens/Profile%20tools/Medical_team.dart';
import 'package:health_care/Frontend/Screens/Profile%20tools/Screening_procedures.dart';
import 'package:health_care/Frontend/Screens/Profile%20tools/Tracked_symptoms.dart';
import 'package:health_care/Frontend/buttons/Transparent_button.dart';
import 'package:health_care/Frontend/constants/constants.dart';

import '../../Profile tools/Med  Reminders/Set_reminder.dart';
import 'profile_menu.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // const ProfilePic(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Create Your Profile!",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(" Save your important inoformation",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                      Text("so its always in your fingertips",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                TransparentButton(
                    text: "Create Profile",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateProfile()),
                      );
                    }),
              ],
            ),
          ),

          const SizedBox(height: 10),
          const Divider(
            color: kPrimaryColor,
            height: 0,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text("My Tools",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
          ProfileMenu(
              text: "Med Reminders",
              icon: "assets/icons/reminder.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetReminders()),
                );
              }),
          ProfileMenu(
              text: "Medical Team",
              icon: "assets/icons/med_team.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MedicalTeam()),
                );
              }),
          ProfileMenu(
              text: "Tracked Symptoms",
              icon: "assets/icons/symptoms.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrackedSymptoms()),
                );
              }),
          ProfileMenu(
              text: "Screenings & Procedures",
              icon: "assets/icons/procedures.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Procedures()),
                );
              }),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text("Saved",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700))),
          ProfileMenu(
            text: "Conditions",
            icon: "assets/icons/conditions.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Drugs",
            icon: "assets/icons/drugs.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Articles",
            icon: "assets/icons/articles.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

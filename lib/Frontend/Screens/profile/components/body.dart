import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          const Text("tools"),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/UserIcon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Med Reminders",
            icon: "assets/icons/reminder.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Medical Team",
            icon: "assets/icons/med_team.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Tracked Symptoms",
            icon: "assets/icons/symptoms.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Screenings & Procedures",
            icon: "assets/icons/procedures.svg",
            press: () {},
          ),
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

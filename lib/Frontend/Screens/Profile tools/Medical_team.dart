import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../buttons/Transparent_button.dart';
import '../../constants/constants.dart';
import '../Doctor_Screen.dart';

class MedicalTeam extends StatefulWidget {
  const MedicalTeam({super.key});

  @override
  State<MedicalTeam> createState() => _MedicalTeamState();
}

class _MedicalTeamState extends State<MedicalTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Removes the shadow
          title: const Text(
            'Medication Team',
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
                "assets/icons/med_team.svg",
                color: kPrimaryColor,
                width: 22,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Nothing here yet",
                  style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(
                height: 5,
              ),
              const Text("Save your doctors contact",
                  style: TextStyle(fontSize: 10)),
              const Text("information so it's alaways on hand.",
                  style: TextStyle(fontSize: 10)),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TransparentButton(
                  text: 'Add Medical Team',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoctorScreen()));
                    // Action to perform when the button is pressed
                    print('Button pressed!');
                  },
                ),
              ),
            ]));
  }
}

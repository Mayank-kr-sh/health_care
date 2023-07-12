import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../buttons/Transparent_button.dart';
import '../../constants/constants.dart';
import '../Auth/Create_profile.dart';

class Procedures extends StatefulWidget {
  const Procedures({super.key});

  @override
  State<Procedures> createState() => _ProceduresState();
}

class _ProceduresState extends State<Procedures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Removes the shadow
          title: const Text(
            'Screening & Procedures',
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
                "assets/icons/procedures.svg",
                color: kPrimaryColor,
                width: 42,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Nothing here yet",
                  style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(
                height: 5,
              ),
              const Text("Register so we can show you",
                  style: TextStyle(fontSize: 12)),
              const Text("personalized screenings & procedures.",
                  style: TextStyle(fontSize: 12)),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TransparentButton(
                  text: 'Register',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateProfile()));
                  },
                ),
              ),
            ]));
  }
}

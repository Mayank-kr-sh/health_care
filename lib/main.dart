import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Doctor_Screen.dart';
import 'package:health_care/Frontend/Screens/Home_Screen.dart';
import 'package:health_care/Frontend/Screens/Profile_Screen.dart';
import 'package:health_care/Frontend/Widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomBottomNavBar(
        screens: [
          HomeScreen(),
          DoctorScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}

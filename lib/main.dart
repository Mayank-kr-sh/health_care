import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Doctor_Screen.dart';
import 'package:health_care/Frontend/Screens/Home_Screen.dart';
import 'package:health_care/Frontend/Screens/profile/Profile_Screen.dart';
import 'package:health_care/Frontend/Widgets/bottom_nav_bar.dart';

import 'Frontend/Widgets/animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showDialog = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        _showDialog = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          if (!_showDialog)
            const CustomBottomNavBar(
              screens: [
                HomeScreen(),
                DoctorScreen(),
                ProfileScreen(),
              ],
            ),
          if (_showDialog)
            const Opacity(
              opacity: 0.7,
              child: CustomBottomNavBar(
                screens: [
                  HomeScreen(),
                  DoctorScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
          if (_showDialog)
            AppInfoDialog(
              onClose: () {
                setState(() {
                  _showDialog = false;
                });
              },
            ),
        ],
      ),
    );
  }
}

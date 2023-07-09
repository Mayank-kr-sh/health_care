import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Auth/Sign_in.dart';
import 'package:health_care/Frontend/constants/constants.dart';

// import '../../Widgets/bottom_nav_bar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2, // Removes the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profile',
              style: TextStyle(color: Colors.black87),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              child: const Row(
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  Icon(
                    Icons.login_outlined,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Body(),
    );
  }
}

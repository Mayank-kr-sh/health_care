import 'package:flutter/material.dart';

class DrawerSection extends StatelessWidget {
  const DrawerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final iconSize =
        screenSize.width * 0.055; // Adjust the percentage as needed
    final titleFontSize =
        13.5 * textScaleFactor; // Adjust the base font size as needed

    return Drawer(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 10, bottom: 5),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 80,
                  // height: ,
                  // adjust width and height as needed
                ),
              ),
              const Divider(),
            ],
          ),
          ListTile(
            leading: Icon(Icons.person_add, size: iconSize),
            title: Text(
              'User Registration/Sign In',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle user registration/sign in tap
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services, size: iconSize),
            title: Text(
              'Pills Identifier',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle pills identifier tap
            },
          ),
          ListTile(
            leading: Icon(Icons.mic, size: iconSize),
            title: Text(
              'Podcast',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle podcast tap
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.notifications, size: iconSize),
            title: Text(
              'Notifications',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle notifications tap
            },
          ),
          ListTile(
            leading: Icon(Icons.mail, size: iconSize),
            title: Text(
              'Newsletter',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle newsletter tap
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.feedback, size: iconSize),
            title: Text(
              'Feedback',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle feedback tap
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, size: iconSize),
            title: Text(
              'Privacy & Legal',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle privacy & legal tap
            },
          ),
          ListTile(
            leading: Icon(Icons.star, size: iconSize),
            title: Text(
              'Rate and Review',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle rate and review tap
            },
          ),
          ListTile(
            leading: Icon(Icons.share, size: iconSize),
            title: Text(
              'Tell Friends',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle tell friends tap
            },
          ),
          ListTile(
            leading: Icon(Icons.apps, size: iconSize),
            title: Text(
              'Other WebMD Apps',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle other WebMD apps tap
            },
          ),
        ],
      ),
    );
  }
}

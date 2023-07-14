import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/Frontend/constants/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screens/Pills Id/pills_id.dart';
import '../Screens/newsletter.dart';
import '../Screens/notification.dart';
import '../Screens/privacy.dart';

class DrawerSection extends StatelessWidget {
  final String appLink =
      'https://your_app_link'; // app linke which i get from playstore
  const DrawerSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final iconSize = screenSize.width * 0.06; // Adjust the percentage as needed
    final titleFontSize =
        16.0 * textScaleFactor; // Adjust the base font size as needed

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
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                'assets/icons/User.svg',
                width: iconSize,
              ),
            ),
            title: Text(
              'User Registration/Sign In',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle user registration/sign in tap
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                'assets/icons/drugs.svg',
                width: iconSize,
                color: const Color.fromARGB(255, 131, 130, 130),
              ),
            ),
            title: Text(
              'Pills Identifier',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PillIdentifierPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.mic_none_outlined, size: iconSize),
            ),
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
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.notifications_none, size: iconSize),
            ),
            title: Text(
              'Notifications',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle notifications tap NotificationSettingsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationSettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.mail_outline, size: iconSize),
            ),
            title: Text(
              'Newsletter',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle newsletter tap NewsLetter
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewsLetter(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.feedback_outlined, size: iconSize),
            ),
            title: Text(
              'Feedback',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle feedback tap
              String feedbackMessage = 'Enter your feedback message here';
              Share.share(feedbackMessage);
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.privacy_tip_outlined, size: iconSize),
            ),
            title: Text(
              'Privacy & Legal',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyLegalScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.star_border, size: iconSize),
            ),
            title: Text(
              'Rate and Review',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle rate and review tap
              _launchPlayStore();
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.share, size: iconSize),
            ),
            title: Text(
              'Tell Friends',
              style: TextStyle(fontSize: titleFontSize),
            ),
            onTap: () {
              // Handle tell friends tap
              Share.share(appLink);
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.5),
              child: Icon(Icons.apps, size: iconSize),
            ),
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

void _launchPlayStore() async {
  const String packageName =
      'your_package_name'; // Replace with your app's package name
  final Uri playStoreUri =
      Uri.parse('https://play.google.com/store/apps/details?id=$packageName');

  if (await canLaunch(playStoreUri.toString())) {
    await launch(playStoreUri.toString());
  } else {
    throw 'Could not launch Play Store';
  }
}

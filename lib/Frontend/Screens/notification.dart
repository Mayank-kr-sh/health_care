import 'package:flutter/material.dart';
import '../Widgets/notification_card.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Open notifications screen
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Select which notifications you would like to receive:',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 18),
            NotificationCard(
              icon: Icons.article,
              title: 'News',
              subtitle: 'Stay current on the top stories you care about most.',
              enabled: true,
            ),
            NotificationCard(
              icon: Icons.radio_button_checked,
              title: 'Allergy Tracker',
              subtitle: 'Alert me when allergy level are high in my area.',
              enabled: true,
            ),
          ],
        ),
      ),
    );
  }
}

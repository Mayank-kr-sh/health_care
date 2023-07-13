import 'package:flutter/material.dart';
import 'package:health_care/Frontend/constants/constants.dart';
import '../Widgets/notification_card.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewsLetterState createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Subscribe to Our Newsletters',
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
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                NotificationCard(
                  icon: Icons.health_and_safety,
                  title: 'Good Health',
                  subtitle:
                      'Wellness tips designe to help you live happier and healthier.',
                ),
                NotificationCard(
                  icon: Icons.food_bank_rounded,
                  title: 'Food and Fitness',
                  subtitle:
                      'Tip for eating better and expercising smater, complete with healthy recipes and workout guides.',
                ),
                NotificationCard(
                  icon: Icons.person_3_rounded,
                  title: "Women's Health",
                  subtitle:
                      'News and information about keeping women healthy and well.',
                ),
                NotificationCard(
                  icon: Icons.person_2,
                  title: "Men's men",
                  subtitle:
                      'News and information about keeping men healthy and well.',
                ),
                NotificationCard(
                  icon: Icons.health_and_safety,
                  title: 'Diabetes',
                  subtitle:
                      'The latest information to help you stay on top of diabetes, with expert guidence on dite, exrecies and medications.',
                ),
              ],
            ),
            Column(
              children: [
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Email Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 52,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform search action
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(14),
                          backgroundColor: kPrimaryColor,
                        ),
                        child: const Text('SUBSCRIBE'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        'By Clicking Subscribe, I agree to the WebMMd ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Term and Condition',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '& privicy Policy ',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'By Clicking Subscribe, I agree to the WebMMd ',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

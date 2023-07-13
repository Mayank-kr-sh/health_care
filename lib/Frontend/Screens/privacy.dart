import 'package:flutter/material.dart';

class PrivacyLegalScreen extends StatelessWidget {
  const PrivacyLegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Privacy & Legal',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen('Text 1'),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Text 1',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen('Text 2'),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Text 2',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen('Text 3'),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Text 3',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String title;

  DetailsScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Description for $title',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

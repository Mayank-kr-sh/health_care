import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  final String heading;
  final String body;
  final String? imageUrl;

  const NewsDetailScreen({
    Key? key,
    required this.heading,
    required this.body,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          // Build your news detail UI here using widget.heading, widget.body, widget.imageUrl
          ),
    );
  }
}

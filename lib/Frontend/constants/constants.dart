import 'package:flutter/material.dart';

import '../Model/News.dart';

const kPrimaryColor = Color.fromARGB(255, 38, 208, 72);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

List imageList = [
  {
    "id": 1,
    "image_path": 'assets/images/poster.png',
  },
  {
    "id": 2,
    "image_path": 'assets/images/poster1.png',
  },
  {
    "id": 3,
    "image_path": 'assets/images/poster2.png',
  },
  {
    "id": 4,
    "image_path": 'assets/images/poster3.png',
  },
];

List<News> newsList = [
  News(
    heading: 'Important News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl: null,
  ),
  News(
    heading: 'Breaking News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJzaNKfC1XFBaE9PGyjJVhBOQCN-o2Yzt8riT4GTVG_iz9SplrjXVLk1W_eKDFyqZWTI8',
  ),
  News(
    heading: 'Important News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl: null,
  ),
  News(
    heading: 'Breaking News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJzaNKfC1XFBaE9PGyjJVhBOQCN-o2Yzt8riT4GTVG_iz9SplrjXVLk1W_eKDFyqZWTI8',
  ),
  News(
    heading: 'Important News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl: null,
  ),
  News(
    heading: 'Important News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl: null,
  ),
  News(
    heading: 'Important News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJzaNKfC1XFBaE9PGyjJVhBOQCN-o2Yzt8riT4GTVG_iz9SplrjXVLk1W_eKDFyqZWTI8",
  ),
  News(
    heading: 'Important News',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    imageUrl: null,
  ),
  // Add more news items as needed
];

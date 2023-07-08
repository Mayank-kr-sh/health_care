import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:health_care/Frontend/Screens/profile/Profile_Screen.dart';
import 'package:health_care/Frontend/Widgets/card_widget.dart';
import 'package:health_care/Frontend/Widgets/drawer_section.dart';
import 'package:health_care/Frontend/Widgets/news_card.dart';

import '../Model/News.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentImageIndex = 0;

  final List<String> imageUrls = [
    // Add your image URLs here
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK_ZtDXoJHsFCOU19Bwq651kOnNyYw02EKFcGm0kguR25nOHKEa5LOfu0uHSqMLO32MXg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfI1E2hkfEol-feKn8W7kYy3hvGE63KbsFOcFHVCfVt3kA1MHoNoIfAVq6RzgAdWyoXDY',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQszTjq1X1UjbrloQWhebWpMtY6qudp6-1LlMu_UAKBDNzsd8Z7gucQvJdtfeEPW_5uhWA',
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 143, 133, 133),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              // Perform search action here
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12.0),
              hintText: 'Search',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        actions: [],
      ),
      drawer: DrawerSection(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.25,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: imageUrls.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imageUrl = imageUrls[index];
                      return InkWell(
                        onTap: () {
                          // Handle click to open next page
                        },
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: screenHeight * 0.25,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageUrls.map((url) {
                        int index = imageUrls.indexOf(url);
                        return Container(
                          width: 4.0,
                          height: 4.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentImageIndex
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardWidget(
                  title: 'Card 1',
                  iconData: Icons.account_circle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
                CardWidget(
                  title: 'Card 2',
                  iconData: Icons.settings,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardWidget(
                  title: 'Card 4',
                  iconData: Icons.favorite,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
                CardWidget(
                  title: 'Card 5',
                  iconData: Icons.shopping_cart,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardWidget(
                  title: 'Card 4',
                  iconData: Icons.favorite,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
                CardWidget(
                  title: 'Card 5',
                  iconData: Icons.shopping_cart,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 16),
              child: Text(
                "Top News",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            for (var news in newsList)
              CardWidgetApi(
                heading: news.heading,
                body: news.body,
                imageUrl: news.imageUrl,
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:health_care/Frontend/Screens/profile/Profile_Screen.dart';
import 'package:health_care/Frontend/Widgets/card_widget.dart';
import 'package:health_care/Frontend/Widgets/drawer_section.dart';
import 'package:health_care/Frontend/Widgets/news_card.dart';
import '../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  int currIndex = 0;

  Widget _slidingBanner() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            // ignore: avoid_print
            print(currIndex);
          },
          child: CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currIndex == entry.key ? 17 : 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          currIndex == entry.key ? Colors.blue : Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _cardWidget1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CardWidget(
          title: 'Symptom Checker',
          iconData: Icons.radar,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
        ),
        CardWidget(
          title: 'Med Reminders',
          iconData: Icons.timer,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _cardWidget2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CardWidget(
          title: 'Presciption Discounts',
          iconData: Icons.r_mobiledata_sharp,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
        ),
        CardWidget(
          title: 'Drug Interactions',
          iconData: Icons.air_rounded,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _cardWidget3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CardWidget(
          title: 'Allergy Tracker',
          iconData: Icons.radio_button_checked_sharp,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
        ),
        CardWidget(
          title: 'Track Symptoms',
          iconData: Icons.auto_graph,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _searchWidget() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 213, 213),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          // Perform search action here
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
          hintText: 'Search',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
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
        title: _searchWidget(),
        actions: const [],
      ),
      drawer: const DrawerSection(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _slidingBanner(),
            const SizedBox(height: 10.0),
            _cardWidget1(),
            const SizedBox(height: 4.0),
            _cardWidget2(),
            const SizedBox(height: 4.0),
            _cardWidget3(),
            const SizedBox(height: 10.0),
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

import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Widgets/location.dart';
import 'package:health_care/Frontend/Widgets/search.dart';
import 'package:health_care/Frontend/buttons/Transparent_button.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Image(
            image: const AssetImage('assets/images/logo.png'),
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.05,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/logo1.jpg',
            width: double.infinity,
            height: screenSize.height * 0.2,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const LocationDialog();
                        },
                      );
                    },
                    child: SizedBox(
                      width: screenSize.width * 0.6,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenSize.width * 0.01),
                            child: const Icon(
                              Icons.search,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          const Text(
                            'Search doctor, condition or product',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 16),
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        'Zip Code or City, State',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width * 0.28),
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          TransparentButton(
            text: "Search for Doctors",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const LocationDialog();
                },
              );
            },
          )
        ],
      ),
    );
  }
}

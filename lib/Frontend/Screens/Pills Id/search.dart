import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'pills_id.dart';
import '../../constants/Dummy Data/dummyData_Pills.dart';
import '../../constants/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> filteredData = [];

  void search(String searchText) {
    setState(() {
      if (searchText.isNotEmpty) {
        filteredData = dummyData
            .where(
                (data) => data.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      } else {
        filteredData = [];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredData = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Set Medication Reminder',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: kPrimaryColor,
              onChanged: (value) {
                search(value);
              },
              decoration: InputDecoration(
                labelText: 'Search Medication Here',
                labelStyle: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      const Icon(Icons.add_circle, color: kPrimaryColor),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        filteredData[index],
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        "assets/icons/drugs.svg",
                        color: Colors.black,
                        width: 15,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle item click
                    print('Tapped item: ${filteredData[index]}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PillIdentifierPage()));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

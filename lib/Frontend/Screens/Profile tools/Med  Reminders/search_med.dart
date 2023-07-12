import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/Frontend/Screens/Profile%20tools/Med%20%20Reminders/add_reminders.dart';
import 'package:health_care/Frontend/constants/constants.dart';
import 'package:health_care/Frontend/constants/dummyData_med.dart';

class SearchMed extends StatefulWidget {
  const SearchMed({super.key});

  @override
  _SearchMedState createState() => _SearchMedState();
}

class _SearchMedState extends State<SearchMed> {
  List<String> dummyData = dummyMed;

  List<String> filteredData = [];

  @override
  void initState() {
    filteredData;
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> searchResults = [];
    searchResults.addAll(dummyData);

    if (query.isNotEmpty) {
      searchResults = searchResults
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults = [];
    }

    setState(() {
      filteredData = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
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
                filterSearchResults(value);
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
                      // crossAxisAlignment: CrossAxisAlignment.start,
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
                        // const Divider(
                        //   color: kPrimaryColor,
                        //   height: 0,
                        //   thickness: 1,
                        //   // indent: 10,
                        //   // endIndent: 10,
                        // ),
                      ],
                    ),
                    onTap: () {
                      print('Tapped item: ${filteredData[index]}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddReminder(
                            text: filteredData[index],
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

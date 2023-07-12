import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/Frontend/constants/constants.dart';

import '../../../constants/Dummy Data/symptomsData.dart';
import 'addSymptmsEntry.dart';

class SearchSymptoms extends StatefulWidget {
  const SearchSymptoms({super.key});

  @override
  _SearchSymptomsState createState() => _SearchSymptomsState();
}

class _SearchSymptomsState extends State<SearchSymptoms> {
  List<String> dummyData = symptoms;

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
          'Track symptoms or condition',
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
                labelText: 'Enter symptoms here',
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
                    title: Column(
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.add_circle, color: Colors.red),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              filteredData[index],
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/virus.svg",
                              // color: Colors.black,
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                          height: 0,
                          thickness: 1,
                          // indent: 10,
                          // endIndent: 10,
                        ),
                      ],
                    ),
                    onTap: () {
                      print('Tapped item: ${filteredData[index]}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddSymptomsEntry(
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

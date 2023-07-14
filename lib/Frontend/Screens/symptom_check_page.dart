import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/symptom_check_buttons.dart';
import 'package:health_care/Frontend/Screens/symptom_check_form.dart';

class SymptomCheckPage extends StatefulWidget {
  const SymptomCheckPage({Key? key});

  @override
  State<SymptomCheckPage> createState() => _SymptomCheckPageState();
}

class _SymptomCheckPageState extends State<SymptomCheckPage> {
  bool isMaleButtonPressed = false;
  bool isFemaleButtonPressed = false;
  String age = '';
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPageIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex++;
      });
    } else {
      // Handle the last page logic, such as submitting the form or navigating to a new screen
    }
  }

  void _goToPreviousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        title: const Text(
          'Enter Info',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button click
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SymptomCheckForm(
                  age: age,
                  isMaleButtonPressed: isMaleButtonPressed,
                  isFemaleButtonPressed: isFemaleButtonPressed,
                  onAgeChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                  onMaleButtonPressed: () {
                    setState(() {
                      isMaleButtonPressed = !isMaleButtonPressed;
                      isFemaleButtonPressed = false;
                    });
                  },
                  onFemaleButtonPressed: () {
                    setState(() {
                      isFemaleButtonPressed = !isFemaleButtonPressed;
                      isMaleButtonPressed = false;
                    });
                  },
                ),
                // Add additional pages as needed
                Container(
                  color: Colors.green,
                  child: Center(child: Text('Page 2')),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(child: Text('Page 3')),
                ),
              ],
            ),
          ),
          SymptomCheckButtons(
            age: age,
            isMaleButtonPressed: isMaleButtonPressed,
            isFemaleButtonPressed: isFemaleButtonPressed,
            currentPageIndex: _currentPageIndex,
            totalPageCount: 3, // Update the total number of pages here
            onNextPage: _goToNextPage,
            onPreviousPage: _goToPreviousPage,
          ),
        ],
      ),
    );
  }
}

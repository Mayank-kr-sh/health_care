import 'package:flutter/material.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class SymptomCheckButtons extends StatelessWidget {
  const SymptomCheckButtons({
    Key? key,
    required this.age,
    required this.isMaleButtonPressed,
    required this.isFemaleButtonPressed,
    required this.currentPageIndex,
    required this.totalPageCount,
    required this.onNextPage,
    required this.onPreviousPage,
  }) : super(key: key);

  final String age;
  final bool isMaleButtonPressed;
  final bool isFemaleButtonPressed;
  final int currentPageIndex;
  final int totalPageCount;
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;

  bool get isFieldsFilled =>
      (isMaleButtonPressed || isFemaleButtonPressed) && age.isNotEmpty;

  void handleNextButton(BuildContext context) {
    if (isFieldsFilled) {
      onNextPage();
    } else {
      String errorMessage = '';

      if (!isMaleButtonPressed && !isFemaleButtonPressed && age.isEmpty) {
        errorMessage = 'Sex and age are required.';
      } else if (!isMaleButtonPressed && !isFemaleButtonPressed) {
        errorMessage = 'Please select a sex.';
      } else if (age.isEmpty) {
        errorMessage = 'Please enter your age.';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: List.generate(
                    totalPageCount,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == currentPageIndex
                            ? kPrimaryColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => handleNextButton(context),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: kPrimaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () => handleNextButton(context),
                    style: TextButton.styleFrom(
                      foregroundColor: kPrimaryColor,
                    ),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

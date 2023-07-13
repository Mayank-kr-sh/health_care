import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/Frontend/constants/constants.dart';
import 'package:intl/intl.dart';

class AddSymptomsEntry extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;
  const AddSymptomsEntry({
    super.key,
    required this.text,
  });

  @override
  State<AddSymptomsEntry> createState() => _AddSymptomsEntryState();
}

class _AddSymptomsEntryState extends State<AddSymptomsEntry> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int selectedContainerIndex = -1;
  TextEditingController controllerNote1 = TextEditingController();
  TextEditingController controllerNote2 = TextEditingController();
  int textLengthNote1 = 0;
  int textLengthNote2 = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controllerNote1.addListener(updateTextLengthNote1);
    controllerNote2.addListener(updateTextLengthNote2);
  }

  void selectContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  @override
  void dispose() {
    controllerNote1.removeListener(updateTextLengthNote1);
    controllerNote1.dispose();
    controllerNote2.removeListener(updateTextLengthNote2);
    controllerNote2.dispose();
    super.dispose();
  }

  void updateTextLengthNote1() {
    setState(() {
      textLengthNote1 = controllerNote1.text.length;
    });
  }

  void updateTextLengthNote2() {
    setState(() {
      textLengthNote2 = controllerNote2.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('MMM dd, yyyy');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Add Symptoms',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                  // color: Colors.grey.shade300,
                  padding: const EdgeInsets.all(16.0),
                  height: 80,
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 207, 233, 255),
                              border: Border.all(
                                color: Colors.transparent,
                                // width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          alignment: Alignment.center,
                          height: 60,
                          width: constraints.maxWidth *
                              0.4, // Adjust the width proportionally
                          // color: Colors.blue.shade100,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "      Date",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Text(
                                  dateFormatter.format(selectedDate),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _selectTime(context),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 207, 233, 255),
                              border: Border.all(
                                color: Colors.transparent,
                                // width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          alignment: Alignment.center,
                          height: 60,
                          width: constraints.maxWidth *
                              0.4, // Adjust the width proportionally
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "      Time",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Text(
                                  selectedTime.format(context),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Severity Level',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => {selectContainer(0)},
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: selectedContainerIndex == 0
                                ? Colors.grey.shade600
                                : null,
                            border: Border.all(
                              color: Colors.grey.shade600,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "None",
                          style: TextStyle(
                              color: selectedContainerIndex == 0
                                  ? Colors.white
                                  : Colors.grey.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => {selectContainer(1)},
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: selectedContainerIndex == 1
                                ? Colors.green
                                : null,
                            border: Border.all(
                              color: Colors.green,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Mild",
                          style: TextStyle(
                              color: selectedContainerIndex == 1
                                  ? Colors.white
                                  : Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => {selectContainer(2)},
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: selectedContainerIndex == 2
                                ? Colors.orange
                                : null,
                            border: Border.all(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Moderate",
                          style: TextStyle(
                              color: selectedContainerIndex == 2
                                  ? Colors.white
                                  : Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => {selectContainer(3)},
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                selectedContainerIndex == 3 ? Colors.red : null,
                            border: Border.all(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Severe",
                          style: TextStyle(
                              color: selectedContainerIndex == 3
                                  ? Colors.white
                                  : Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: kPrimaryColor,
                controller: controllerNote1,
                decoration: InputDecoration(
                  labelText: 'Notes',
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Factor you think might be having an impact on your",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "health outcomes",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    '$textLengthNote1 /100',
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade500),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                cursorColor: kPrimaryColor,
                controller: controllerNote2,
                decoration: InputDecoration(
                  labelText: 'Notes',
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Factor you think might be having an impact on your",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "health outcomes",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    '$textLengthNote2 /500',
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade500),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // Customize button appearance
                      backgroundColor:
                          kPrimaryColor, // Set button background color
                      foregroundColor: Colors.white, // Set text color
                      textStyle:
                          const TextStyle(fontSize: 16), // Set text style
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            16), // Set button border radius
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24), // Set button padding
                    ),
                    child: const Text(
                      "Done",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

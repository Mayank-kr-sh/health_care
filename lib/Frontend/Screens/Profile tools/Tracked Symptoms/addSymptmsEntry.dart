import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Medication Reminders',
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
      body: Container(
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
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Severity Level',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade600,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text("None"),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text("Mild"),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text("Moderate"),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text("Severe"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: constraints.maxWidth *
                            0.4, // Adjust the width proportionally
                        color: Colors.blue.shade100,
                        child: Text(
                          dateFormatter.format(selectedDate),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectTime(context),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: constraints.maxWidth *
                            0.4, // Adjust the width proportionally
                        color: Colors.blue.shade100,
                        child: Text(
                          selectedTime.format(context),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

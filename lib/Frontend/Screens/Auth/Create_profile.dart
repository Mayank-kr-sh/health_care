import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Auth/Sign_in.dart';
import 'package:intl/intl.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  bool _passwordVisible = false;
  bool _termsChecked = false;
  // ignore: unused_field
  DateTime? _selectedDate;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _optionalFieldController = TextEditingController();
  final _sexController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _optionalFieldController.dispose();
    _sexController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _optionalFieldController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (!_termsChecked) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Terms and Conditions'),
              content: const Text('Please accept the terms and conditions.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: const Text(
            'Register',
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
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.25,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/logo1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    obscureText: !_passwordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.calendar_today),
                      suffixIcon: Icon(Icons.arrow_forward_ios),
                    ),
                    controller: _optionalFieldController,
                    readOnly: true, // Make the text field read-only
                    onTap: _selectDate, // Call _selectDate() when tapped
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _sexController,
                    decoration: const InputDecoration(
                      labelText: 'Sex (Optional)',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      prefixIcon: SizedBox(
                        width: 24,
                        child: Icon(Icons.person_2_rounded),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Sex';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Checkbox(
                        value: _termsChecked,
                        onChanged: (value) {
                          setState(() {
                            _termsChecked = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'I have read and agree to abide WebMd',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 11, 7, 7),
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'terms and conditions',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 4),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'and',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: _register,
                    child: const Text('Register'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

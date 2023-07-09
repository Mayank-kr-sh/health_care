import 'package:flutter/material.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        title: const Text(
          'Sign In',
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, // Change the button color here
              ),
              onPressed: () {
                // Sign-in button action
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Forgot password button action
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Haven't an account? "),
                TextButton(
                  onPressed: () {
                    // Sign Up button action
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:health_care/Frontend/Screens/Auth/Create_profile.dart';
import 'package:health_care/Frontend/Screens/Auth/Forget.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      _emailErrorText =
          _emailController.text.isEmpty ? 'Please enter your email' : null;
      _passwordErrorText = _passwordController.text.isEmpty
          ? 'Please enter your password'
          : null;
    });

    if (_emailErrorText == null && _passwordErrorText == null) {
      // Perform sign-in button action
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: double.infinity,
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                errorText: _emailErrorText,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                errorText: _passwordErrorText,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: _validateFields,
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Forgot password button action ForgotPasswordPage
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ForgotPasswordDialog();
                  },
                );
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Haven't an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateProfile()));
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

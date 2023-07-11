import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final bool _showSignInPage = true;
  bool _showErrorMessage = false;
  bool _showOTPInput = false;

  void _sendButtonPressed() {
    if (_showSignInPage) {
      setState(() {
        _showErrorMessage = true;
      });
    } else {
      setState(() {
        _showOTPInput = true;
      });
    }
  }

  void _backButtonPressed() {
    if (_showOTPInput) {
      setState(() {
        _showOTPInput = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.black54,
            ),
          ),
        ),
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_showSignInPage)
                  Column(
                    children: [
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "We'll email you a link to reset your password.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter your registered email',
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 90,
                        child: ElevatedButton(
                          onPressed: _sendButtonPressed,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            backgroundColor: kPrimaryColor,
                          ),
                          child: const Text('Send'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (_showErrorMessage)
                        const SizedBox(
                          height: 16,
                          child: Text(
                            'Invalid email. Please enter a valid email address.',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                if (_showOTPInput)
                  Column(
                    children: [
                      const Text(
                        'Enter OTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter the OTP',
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Perform OTP verification action
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: kPrimaryColor,
                        ),
                        child: const Text('Verify OTP'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _backButtonPressed,
                        child: const Text('Back'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

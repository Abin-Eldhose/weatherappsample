// lib/features/auth/view/phone_number_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/auth/view/otp_verification_page.dart';
import 'package:weather_app/features/auth/view_model/auth_provider.dart';

class PhoneNumberScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.3,
            ),
            Text(
              "Enter Your 10 Digit  Phone Number to Login",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final phoneNumber = _phoneController.text.trim();
                  final loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);

                  await loginProvider.phoneAuthentication(phoneNumber);

                  // Navigate to OTP screen
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OtpScreen()),
                  );
                },
                child: const Text('Send OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

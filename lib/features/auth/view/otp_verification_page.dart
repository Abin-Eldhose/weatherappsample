// lib/features/auth/view/otp_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/auth/view_model/auth_provider.dart';
import 'package:weather_app/features/weather/view/weather_home.dart';

class OtpScreen extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();

  OtpScreen({super.key});

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
              'Enter the otp to verify your number ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(labelText: 'OTP'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final otp = _otpController.text.trim();
                  final loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);

                  final isVerified = await loginProvider.verifyOtp(otp);

                  if (isVerified) {
                    // Navigate to Weather Home Page
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const WeatherHomePage()),
                      (route) => false,
                    );
                  } else {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid OTP')),
                    );
                  }
                },
                child: const Text('Verify OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

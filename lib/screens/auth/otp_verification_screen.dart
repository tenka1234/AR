import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VERIFY OTP')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Text('Verify your email', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('We sent a 6-digit code to your email. Please enter it below.'),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => SizedBox(
                width: 60,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                ),
              )),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.push('/reset-password'),
              child: const Text('VERIFY'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Resend Code', style: TextStyle(color: AppTheme.primaryRed)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ReturnInstructionsScreen extends StatelessWidget {
  const ReturnInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RETURN GUIDE')),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How to return your order:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('1. Package your item securely in its original packaging.'),
            SizedBox(height: 12),
            Text('2. Print the return label from your email.'),
            SizedBox(height: 12),
            Text('3. Drop off at any authorized courier point.'),
            SizedBox(height: 30),
            Text('Your refund will be processed within 5-7 business days of receipt.', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

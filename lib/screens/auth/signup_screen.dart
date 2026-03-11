import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CREATE ACCOUNT', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JOIN THE\nAR COLLECTION',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(height: 1.1),
            ).animate().fadeIn().slideX(begin: -10, end: 0),
            const SizedBox(height: 12),
            Text(
              'Exclusive access to high-fashion and styling trends.',
              style: Theme.of(context).textTheme.bodyMedium,
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 48),
            const TextField(decoration: InputDecoration(labelText: 'FULL NAME')),
            const SizedBox(height: 24),
            const TextField(decoration: InputDecoration(labelText: 'EMAIL ADDRESS')),
            const SizedBox(height: 24),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'PASSWORD')),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('BECOME A MEMBER'),
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 40),
            Center(
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text('ALREADY A MEMBER? LOG IN', style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

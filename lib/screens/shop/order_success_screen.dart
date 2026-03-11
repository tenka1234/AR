import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
              const SizedBox(height: 24),
              const Text('Order Placed!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Your order has been placed successfully. You will receive an email confirmation shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('BACK TO SHOPPING'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/profile/orders'),
                child: const Text('VIEW ORDER DETAILS', style: TextStyle(color: AppTheme.primaryRed)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

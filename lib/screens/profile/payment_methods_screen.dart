import 'package:flutter/material.dart';
import '../../theme.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAYMENT METHODS')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildCardItem('**** **** **** 1234', 'Expires 12/26', true),
          _buildCardItem('**** **** **** 5678', 'Expires 08/25', false),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('ADD NEW CARD'),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(String number, String expiry, bool isDefault) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.credit_card, color: Colors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(expiry, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
          if (isDefault) const Icon(Icons.check_circle, color: AppTheme.primaryRed),
        ],
      ),
    );
  }
}

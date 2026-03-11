import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _selectedPayment = 0;

  final List<Map<String, dynamic>> _payments = [
    {'title': 'CARD ENDING IN 4242', 'icon': Icons.credit_card, 'type': 'VISA'},
    {'title': 'SOPHIA.R@PAYPAL.COM', 'icon': Icons.account_balance_wallet, 'type': 'PAYPAL'},
    {'title': 'APPLE PAY', 'icon': Icons.apple, 'type': 'WALLET'},
    {'title': 'KLARNA SPLIT-PAY', 'icon': Icons.shutter_speed, 'type': 'EMI'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAYMENT METHOD', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: _payments.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedPayment == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedPayment = index),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.matteBlack : Colors.white,
                      border: Border.all(color: isSelected ? AppTheme.matteBlack : Colors.grey[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _payments[index]['icon'] as IconData,
                          color: isSelected ? Colors.white : AppTheme.matteBlack,
                          size: 20,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _payments[index]['title'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : AppTheme.matteBlack,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _payments[index]['type'] as String,
                              style: TextStyle(
                                fontSize: 10,
                                color: isSelected ? AppTheme.primaryRed : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (isSelected) const Icon(Icons.check_circle, color: AppTheme.primaryRed, size: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _buildBottomAction(context),
        ],
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 48),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, -10)),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => context.push('/checkout/success'),
        child: const Text('PURCHASE NOW'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';

class ShippingMethodScreen extends StatefulWidget {
  const ShippingMethodScreen({super.key});

  @override
  State<ShippingMethodScreen> createState() => _ShippingMethodScreenState();
}

class _ShippingMethodScreenState extends State<ShippingMethodScreen> {
  int _selectedMethod = 0;

  final List<Map<String, String>> _methods = [
    {'title': 'STANDARD BOUTIQUE', 'desc': '3-5 BUSINESS DAYS', 'price': '\$0.00'},
    {'title': 'EXPRESS RUNWAY', 'desc': '1-2 BUSINESS DAYS', 'price': '\$15.00'},
    {'title': 'PREMIUM CONCIERGE', 'desc': 'SAME DAY DELIVERY', 'price': '\$35.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHIPPING METHOD', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: _methods.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedMethod == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedMethod = index),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.matteBlack : Colors.white,
                      border: Border.all(color: isSelected ? AppTheme.matteBlack : Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _methods[index]['title']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : AppTheme.matteBlack,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _methods[index]['desc']!,
                              style: TextStyle(
                                fontSize: 11,
                                color: isSelected ? Colors.white70 : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          _methods[index]['price']!,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: isSelected ? AppTheme.primaryRed : AppTheme.matteBlack,
                          ),
                        ),
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
        onPressed: () => context.push('/checkout/payment'),
        child: const Text('CONTINUE TO PAYMENT'),
      ),
    );
  }
}

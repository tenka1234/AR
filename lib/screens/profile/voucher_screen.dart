import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY VOUCHERS', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        children: [
          _buildVoucher(context, 'THE RUNWAY EDIT', '20% OFF', 'VALID ON ALL LATEST COLLECTIONS', 'RUNWAY20'),
          _buildVoucher(context, 'WELCOME GIFT', '\$50 OFF', 'MINIMUM SPEND \$200', 'HELLO-AR'),
          _buildVoucher(context, 'BIRTHDAY TREAT', 'FREE SHIPPING', 'BECAUSE YOU ARE SPECIAL', 'HB-SOPHIA'),
        ],
      ),
    );
  }

  Widget _buildVoucher(BuildContext context, String title, String value, String terms, String code) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(color: Colors.grey[500], fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppTheme.matteBlack)),
                      const SizedBox(height: 8),
                      Text(terms, style: TextStyle(color: Colors.grey[600], fontSize: 10, letterSpacing: 1)),
                    ],
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(code, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4, fontSize: 12, color: AppTheme.primaryRed)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: AppTheme.matteBlack,
            alignment: Alignment.center,
            child: const Text('APPLY VOUCHER', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 2)),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }
}

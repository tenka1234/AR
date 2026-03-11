import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class LoyaltyDashboardScreen extends StatelessWidget {
  const LoyaltyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ELITE LOYALTY', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // VIP Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.matteBlack,
                borderRadius: BorderRadius.zero,
                border: Border.all(color: const Color(0xFFD4AF37), width: 0.5), // Subtle Gold
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('GOLD MEMBER', style: TextStyle(color: const Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 2)),
                      const Icon(Icons.auto_awesome, color: Color(0xFFD4AF37), size: 16),
                    ],
                  ),
                  const SizedBox(height: 48),
                  const Text('4,850', style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w900, letterSpacing: -1)),
                  const Text('AVAILABLE REWARD POINTS', style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1)),
                  const SizedBox(height: 40),
                  const Text('SOPHIA REYNOLDS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 12)),
                ],
              ),
            ).animate().fadeIn().scale(begin: const Offset(0.98, 0.98), end: const Offset(1, 1)),
            
            const SizedBox(height: 56),
            Text('EXCLUSIVE PRIVILEGES', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey[400], fontSize: 11)),
            const SizedBox(height: 32),
            
            _buildPrivilege(context, 'EARN AS YOU SHOP', 'Every \$1 spent earns 5 points in our ecosystem.'),
            _buildPrivilege(context, 'EARLY ACCESS', 'Shop the Runway collections 24 hours before public release.'),
            _buildPrivilege(context, 'CONCIERGE CARE', 'Dedicated stylist support available for your wardrobe needs.'),
            
            const SizedBox(height: 56),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryRed),
              child: const Text('REDEEM POINTS'),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {},
              child: const Text('VIEW POINT HISTORY'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivilege(BuildContext context, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, color: AppTheme.primaryRed, size: 18),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1)),
                const SizedBox(height: 6),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

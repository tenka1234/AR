import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDER #$orderId', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
        actions: [
          TextButton(onPressed: () {}, child: const Text('INVOICE', style: TextStyle(fontSize: 10, color: AppTheme.primaryRed, fontWeight: FontWeight.bold))),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TRACK YOUR SHIPMENT', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey[400], fontSize: 11)),
            const SizedBox(height: 32),
            
            _buildTrackingStep('ORDER PLACED', '12 FEB, 10:00 AM', true),
            _buildTrackingStep('QUALITY VERIFICATION', '12 FEB, 14:00 PM', true),
            _buildTrackingStep('DISPATCHED FROM PARIS', '13 FEB, 09:00 AM', true),
            _buildTrackingStep('LOCAL DISTRIBUTION', 'PENDING', false),
            _buildTrackingStep('DELIVERED', 'PENDING', false),
            
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 48),
            
            Text('DELIVERY ARCHIVE', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey[400], fontSize: 11)),
            const SizedBox(height: 24),
            Text('SOPHIA REYNOLDS', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('123 AVENUE DES CHAMPS-ÉLYSÉES\n75008 PARIS, FRANCE', style: TextStyle(color: Colors.grey[600], height: 1.6)),
            
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 48),
            
            Text('CURATED ITEMS', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey[400], fontSize: 11)),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 100,
                  color: AppTheme.backgroundWhite,
                  child: Image.network('https://images.unsplash.com/photo-1544441893-675973e31985?q=80&w=1000', fit: BoxFit.cover),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('SILK EVENING GOWN', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                      const SizedBox(height: 4),
                      Text('SIZE: M | COLOR: NOIR', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                      const SizedBox(height: 12),
                      const Text('\$899.00', style: TextStyle(fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn(),
            
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryRed),
              child: const Text('CONTACT CONCIERGE'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingStep(String title, String time, bool isDone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.radio_button_checked : Icons.radio_button_off,
            size: 16,
            color: isDone ? AppTheme.primaryRed : Colors.grey[300],
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 12, 
                letterSpacing: 1,
                color: isDone ? AppTheme.matteBlack : Colors.grey[400]
              )),
              const SizedBox(height: 4),
              Text(time, style: TextStyle(fontSize: 10, color: Colors.grey[500])),
            ],
          ),
        ],
      ),
    );
  }
}

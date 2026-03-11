import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDER HISTORY', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        itemCount: 8,
        itemBuilder: (context, index) {
          final status = index == 0 ? 'SHIPPED' : 'DELIVERED';
          final color = index == 0 ? AppTheme.primaryRed : Colors.green[700];
          
          return GestureDetector(
            onTap: () => context.push('/profile/order-detail/${1024 + index}'),
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                children: [
                   Container(
                    width: 60,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppTheme.backgroundWhite,
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1544441893-675973e31985?q=80&w=1000'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ORDER #AR-${202488 + index}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1)),
                        const SizedBox(height: 4),
                        Text('PLACED ON 14 FEB 2026', style: TextStyle(fontSize: 10, color: Colors.grey[600], letterSpacing: 1)),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: color!.withValues(alpha: 0.1),
                          ),
                          child: Text(status, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        ),
                      ],
                    ),
                  ),
                  Text('\$${(299.0 + (index * 150)).toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                ],
              ),
            ).animate().fadeIn(delay: (index * 100).ms).slideY(begin: 0.05, end: 0),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class FlashSaleScreen extends StatelessWidget {
  const FlashSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.matteBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text('FLASH SALE', style: TextStyle(color: Colors.white, letterSpacing: 4, fontWeight: FontWeight.bold, fontSize: 14)),
      ),
      body: Column(
        children: [
          // Countdown Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                const Text('ENDING IN', style: TextStyle(color: AppTheme.primaryRed, letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 10)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimeBox('02'),
                    _buildColon(),
                    _buildTimeBox('45'),
                    _buildColon(),
                    _buildTimeBox('12'),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn().slideY(begin: -0.1, end: 0),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(32),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildSaleItem(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(border: Border.all(color: Colors.white24)),
      child: Text(time, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, fontFamily: 'monospace')),
    );
  }

  Widget _buildColon() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(':', style: TextStyle(color: AppTheme.primaryRed, fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSaleItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundWhite,
                  image: const DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=1000'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: AppTheme.primaryRed,
                  child: const Text('70% OFF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('LIMTED EDITION DRESS', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('\$89.00', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: AppTheme.primaryRed)),
                    const SizedBox(width: 8),
                    Text('\$299.00', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey[400], fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 24),
                LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.grey[100],
                  valueColor: const AlwaysStoppedAnimation(AppTheme.primaryRed),
                  minHeight: 2,
                ),
                const SizedBox(height: 8),
                Text('ONLY 4 REMAINING', style: TextStyle(color: Colors.grey[400], fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.1, end: 0);
  }
}

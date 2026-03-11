import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../theme.dart';
import '../../../models/product.dart';
import '../../../widgets/product_card.dart';

class TrendingNowScreen extends StatelessWidget {
  const TrendingNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(8, (idx) => Product(
      id: 'trend_$idx',
      name: 'TRENDING PIECE #${idx + 1}',
      description: 'The most coveted design in our 200-screen collection.',
      price: 199.0 + (idx * 100),
      imageUrl: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1000',
      category: 'Trending',
      sizes: ['S', 'M', 'L'],
      colors: [Colors.black, AppTheme.primaryRed],
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('TRENDING NOW', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(40),
              color: AppTheme.backgroundWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('THE VELOCITY EDIT', style: TextStyle(color: AppTheme.primaryRed, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 2)),
                  const SizedBox(height: 12),
                  Text('WHAT THE WORLD\nIS WEARING.', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 32)),
                  const SizedBox(height: 24),
                  Text('Hyper-curated selections updated in real-time across our global boutiques.', style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.6)),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 32,
                crossAxisSpacing: 24,
                childAspectRatio: 0.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, idx) => ProductCard(product: products[idx]).animate().fadeIn(delay: (idx * 100).ms),
                childCount: products.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

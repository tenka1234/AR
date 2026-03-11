import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

class BrandStoreScreen extends StatelessWidget {
  final String brandName;

  const BrandStoreScreen({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(8, (idx) => Product(
      id: 'brand_${brandName.toLowerCase()}_$idx',
      name: '${brandName.toUpperCase()} SIGNATURE #${idx + 1}',
      description: 'Exclusive seasonal piece from the $brandName boutique.',
      price: 499.0 + (idx * 200),
      imageUrl: 'https://images.unsplash.com/photo-1544441893-675973e31985?q=80&w=1000',
      category: 'Luxury',
      sizes: ['M', 'L'],
      colors: [Colors.black],
    ));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Brand Billboard
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              width: double.infinity,
              color: AppTheme.matteBlack,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?q=80&w=1000',
                    fit: BoxFit.cover,
                  ).animate().scale(begin: const Offset(1.1, 1.1), end: const Offset(1, 1), duration: 2.seconds),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black54, Colors.black87],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'THE BOUTIQUE',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.primaryRed, letterSpacing: 4),
                        ).animate().fadeIn(),
                        const SizedBox(height: 16),
                        Text(
                          brandName.toUpperCase(),
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white, fontSize: 44),
                        ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0),
                        const SizedBox(height: 24),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white, width: 1),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          ),
                          child: const Text('FOLLOW BRAND', style: TextStyle(color: Colors.white, fontSize: 11)),
                        ).animate().fadeIn(delay: 600.ms),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SliverPersistentHeader(
            pinned: true,
            delegate: _BrandNavDelegate(),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
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

class _BrandNavDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Text('ALL COLLECTIONS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 2)),
          const Spacer(),
          IconButton(icon: const Icon(Icons.tune_outlined, size: 18), onPressed: () {}),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;
  @override
  double get minExtent => 60;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

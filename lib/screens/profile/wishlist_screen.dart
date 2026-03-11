import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate mock wishlist items
    final products = List.generate(6, (idx) => Product(
      id: 'wish_$idx',
      name: 'WISHLIST PIECE ${idx + 1}',
      description: 'A timeless inclusion to your curated collection.',
      price: 350.0 + (idx * 120),
      imageUrl: 'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=1000',
      category: 'Saved',
      sizes: ['S', 'M', 'L'],
      colors: [Colors.black, Colors.red],
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('MY WISHLIST', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: products.isEmpty 
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite_border, size: 60, color: Colors.grey),
                const SizedBox(height: 24),
                const Text('YOUR WISHLIST IS CURRENTLY EMPTY', style: TextStyle(letterSpacing: 2, fontSize: 13)),
                const SizedBox(height: 32),
                OutlinedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('EXPLORE THE EDIT'),
                ),
              ],
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 32,
              crossAxisSpacing: 24,
              childAspectRatio: 0.6,
            ),
            itemCount: products.length,
            itemBuilder: (context, idx) {
              return Stack(
                children: [
                  ProductCard(product: products[idx]),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 18, color: AppTheme.matteBlack),
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white70,
                        padding: const EdgeInsets.all(4),
                      ),
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: (idx * 50).ms);
            },
          ),
    );
  }
}

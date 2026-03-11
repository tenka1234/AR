import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

class CategoryStoreScreen extends StatelessWidget {
  final String categoryName;

  const CategoryStoreScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Generate filtered products for this category
    final products = List.generate(12, (idx) => Product(
      id: 'cat_${categoryName.toLowerCase()}_$idx',
      name: '${categoryName.toUpperCase()} PIECE #${idx + 1}',
      description: 'Handcrafted luxury essential from the $categoryName collection.',
      price: 150.0 + (idx * 80),
      imageUrl: 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=1000',
      category: categoryName,
      sizes: ['S', 'M', 'L'],
      colors: [Colors.black, Colors.red],
    ));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.matteBlack,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                categoryName.toUpperCase(),
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=1000',
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black45),
                ],
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THE $categoryName EDIT',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 10, letterSpacing: 3),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Curated Selection',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
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
                (context, idx) => ProductCard(product: products[idx]).animate().fadeIn(delay: (idx * 50).ms),
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

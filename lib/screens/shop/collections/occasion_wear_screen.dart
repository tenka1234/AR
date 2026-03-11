import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme.dart';
import '../../../models/product.dart';
import '../../../widgets/product_card.dart';

class OccasionWearScreen extends StatelessWidget {
  final String occasion;

  const OccasionWearScreen({super.key, required this.occasion});

  @override
  Widget build(BuildContext context) {
    // Dynamic imagery based on occasion type
    final isWedding = occasion.toLowerCase().contains('wedding');
    final isParty = occasion.toLowerCase().contains('party');
    final isArchive = occasion.toLowerCase().contains('archive');
    
    final headerImg = isWedding 
        ? 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?q=80&w=1000'
        : isParty 
            ? 'https://images.unsplash.com/photo-1492691527719-9d1e07e534b4?q=80&w=1000'
            : isArchive
                ? 'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=1000'
                : 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1000';

    final products = List.generate(12, (idx) => Product(
      id: 'occ_${occasion}_$idx',
      name: '${occasion.toUpperCase()} EDIT #${idx + 1}',
      description: 'Exclusive luxury piece curated for ${occasion.replaceAll('-', ' ')}.',
      price: 299.0 + (idx * 200),
      imageUrl: 'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=1000',
      category: occasion,
      sizes: ['S', 'M', 'L'],
      colors: [Colors.black, Colors.white],
    ));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Dramatic Occasion Header
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            backgroundColor: AppTheme.matteBlack,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(headerImg, fit: BoxFit.cover),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 24,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'THE $occasion EDIT',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.primaryRed, fontSize: 11, letterSpacing: 4),
                        ).animate().fadeIn().slideX(begin: -10, end: 0),
                        const SizedBox(height: 12),
                        Text(
                          occasion.toUpperCase().replaceAll('-', ' '),
                          style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold, height: 1.1),
                        ).animate().fadeIn(delay: 200.ms).slideX(begin: -20, end: 0),
                        const SizedBox(height: 24),
                        Container(height: 1, width: 80, color: Colors.white30),
                        const SizedBox(height: 16),
                        Text(
                          'Discover a curated selection of architectural silhouettes and premium materials, handpicked for the modern independent woman.',
                          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5, fontStyle: FontStyle.italic),
                        ).animate().fadeIn(delay: 400.ms),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Selection Stats
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              color: Colors.white,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${products.length} PIECES AVAILABLE', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 10, letterSpacing: 2)),
                      const SizedBox(height: 4),
                      Text('SORTED BY: CURATED', style: TextStyle(color: Colors.grey[400], fontSize: 9, letterSpacing: 1)),
                    ],
                  ),
                  const Spacer(),
                  _buildMiniLabel('FILTER'),
                  const SizedBox(width: 12),
                  _buildMiniLabel('MATERIAL'),
                ],
              ),
            ),
          ),
          
          // Product Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 48,
                crossAxisSpacing: 32,
                childAspectRatio: 0.55,
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

  Widget _buildMiniLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
      child: Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
    );
  }
}

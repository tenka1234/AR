import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Immersive Editorial Header
          SliverAppBar(
            expandedHeight: 550,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.matteBlack,
            actions: [
              IconButton(icon: const Icon(Icons.search_outlined, color: Colors.white, size: 22), onPressed: () => context.push('/search')),
              IconButton(icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 22), onPressed: () => context.push('/cart')),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=1000',
                    fit: BoxFit.cover,
                  ).animate().scale(begin: const Offset(1.1, 1.1), end: const Offset(1, 1), duration: 2.seconds),
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
                          'SS26 ARCHIVE',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.primaryRed, letterSpacing: 4),
                        ).animate().fadeIn().slideX(begin: -10, end: 0),
                        const SizedBox(height: 12),
                        Text(
                          'MODERN LUXURY\nELEVATED.',
                          style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 44, fontWeight: FontWeight.bold, height: 1.1),
                        ).animate().fadeIn(delay: 200.ms).slideX(begin: -20, end: 0),
                        const SizedBox(height: 32),
                        OutlinedButton(
                          onPressed: () => context.push('/occasion/archive-0'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white, width: 1),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          ),
                          child: const Text('EXPLORE THE EDIT', style: TextStyle(color: Colors.white, letterSpacing: 2)),
                        ).animate().fadeIn(delay: 400.ms),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // The 200 Discovery Hubs
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text('THE COLLECTIONS', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 10, letterSpacing: 3, color: Colors.grey[400])),
                   const SizedBox(height: 16),
                   SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: [
                         _buildHubCard(context, 'OCCASIONS', '30 EDITS', '/occasion/wedding-0'),
                         _buildHubCard(context, 'BRAND BOUTIQUES', '20 STORES', '/brands'),
                         _buildHubCard(context, 'SUSTAINABILITY', 'THE HUB', '/info/sustainability-0'),
                         _buildHubCard(context, 'SOCIAL FEED', 'STYLE LOOKS', '/social/discovery'),
                       ],
                     ),
                   ),
                ],
              ),
            ),
          ),

          // High-Fashion Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 24,
                childAspectRatio: 0.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(product: demoProducts[index % demoProducts.length]).animate().fadeIn(delay: (index * 100).ms),
                childCount: 12,
              ),
            ),
          ),
          
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHubCard(BuildContext context, String title, String stats, String route) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.matteBlack,
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stats, style: const TextStyle(color: AppTheme.primaryRed, fontWeight: FontWeight.bold, fontSize: 9, letterSpacing: 2)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 1)),
          ],
        ),
      ),
    ).animate().fadeIn().slideX(begin: 0.1, end: 0);
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[100]!)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navIcon(Icons.home_outlined, true, () {}),
          _navIcon(Icons.search_outlined, false, () => context.push('/search')),
          _navIcon(Icons.favorite_outline, false, () => context.push('/profile/wishlist-all')),
          _navIcon(Icons.person_outline, false, () => context.push('/profile')),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, bool isActive, VoidCallback onTap) {
    return IconButton(
      icon: Icon(icon, color: isActive ? AppTheme.primaryRed : AppTheme.matteBlack, size: 26),
      onPressed: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: CustomScrollView(
        slivers: [
          // Professional Editorial Header
          SliverAppBar(
            expandedHeight: 400,
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
                  Image.network(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000',
                    fit: BoxFit.cover,
                  ).animate().scale(begin: const Offset(1.1, 1.1), end: const Offset(1, 1), duration: 2.seconds),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 24,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SOPHIA REYNOLDS',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white, fontSize: 32),
                        ).animate().fadeIn(delay: 400.ms).slideX(begin: -20, end: 0),
                        const SizedBox(height: 8),
                        Text(
                          'ELITE GOLD MEMBER • PARIS',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.primaryRed, letterSpacing: 3),
                        ).animate().fadeIn(delay: 600.ms),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Massive Hub Navigation (Bento Style)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(context, 'THE ARCHIVE'),
                  const SizedBox(height: 24),
                  _buildBentoGrid(context),
                  const SizedBox(height: 48),
                  
                  _buildSectionHeader(context, 'COLLECTION MANAGEMENT'),
                  const SizedBox(height: 16),
                  _buildListTile(context, 'ORDER HISTORY', 'View your past acquisitions', Icons.auto_awesome_mosaic_outlined, () => context.push('/profile/orders')),
                  _buildListTile(context, 'MY WISHLIST', 'Curated pieces for later', Icons.favorite_border_rounded, () => context.push('/profile/wishlist-all')),
                  _buildListTile(context, 'VOUCHER VAULT', 'Exclusive credits and codes', Icons.confirmation_number_outlined, () => context.push('/profile/vouchers-active')),
                  
                  const SizedBox(height: 48),
                  _buildSectionHeader(context, 'LOGISTICS & SECURITY'),
                  const SizedBox(height: 16),
                  _buildListTile(context, 'SHIPPING ADDRESSES', 'Manage your global delivery nodes', Icons.map_outlined, () => context.push('/profile/addresses-manage')),
                  _buildListTile(context, 'PAYMENT CAPABILITIES', 'Securely managed financial nodes', Icons.credit_card_outlined, () => context.push('/profile/payment-manage')),
                  _buildListTile(context, 'PRIVACY DASHBOARD', 'Control your data and legacy', Icons.security_outlined, () => context.push('/profile/privacy-center')),
                  
                  const SizedBox(height: 48),
                  _buildSectionHeader(context, 'COMMUNITY & SUPPORT'),
                  const SizedBox(height: 16),
                  _buildListTile(context, 'ELITE REFERRALS', 'Share the style with your circle', Icons.people_outline, () => context.push('/profile/refer-friend')),
                  _buildListTile(context, 'HELP CENTER', '24/7 Concierge and support', Icons.support_agent_outlined, () => context.push('/support')),
                  _buildListTile(context, 'GLOBAL POLICIES', 'Sustainability and legal guidelines', Icons.info_outline, () => context.push('/support/faq-shipping')),
                  
                  const SizedBox(height: 80),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => context.go('/login'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppTheme.primaryRed, width: 1),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text('TERMINATE SESSION', style: TextStyle(color: AppTheme.primaryRed, letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 11)),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey[400], fontSize: 10, letterSpacing: 2)),
        const SizedBox(height: 8),
        Container(height: 1, width: 30, color: AppTheme.primaryRed),
      ],
    );
  }

  Widget _buildBentoGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildBentoItem(context, 'ELITE TIER', 'GOLD DASHBOARD', Icons.stars, AppTheme.matteBlack, () => context.push('/profile/loyalty-elite')),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: _buildBentoItem(context, 'WISHLIST', '45 PIECES', Icons.favorite, AppTheme.primaryRed, () => context.push('/profile/wishlist-all')),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildBentoItem(context, 'ACTIVE ORDERS', '2 SHIPMENTS', Icons.local_shipping, Colors.white, () => context.push('/profile/orders'), isDark: false),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildBentoItem(context, 'VOUCHERS', '\$50 CREDITS', Icons.confirmation_number, Colors.white, () => context.push('/profile/vouchers-active'), isDark: false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBentoItem(BuildContext context, String top, String bottom, IconData icon, Color bg, VoidCallback onTap, {bool isDark = true}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bg,
          border: isDark ? null : Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(top, style: TextStyle(color: isDark ? Colors.white70 : Colors.grey[600], fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                Icon(icon, color: isDark ? AppTheme.primaryRed : AppTheme.matteBlack, size: 16),
              ],
            ),
            Text(bottom, style: TextStyle(color: isDark ? Colors.white : AppTheme.matteBlack, fontSize: 13, fontWeight: FontWeight.w900, letterSpacing: 1)),
          ],
        ),
      ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1)),
    );
  }

  Widget _buildListTile(BuildContext context, String title, String subtitle, IconData icon, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppTheme.backgroundWhite, border: Border.all(color: Colors.grey[100]!)),
        child: Icon(icon, size: 20, color: AppTheme.matteBlack),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1)),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.grey[500])),
      trailing: const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
    );
  }
}

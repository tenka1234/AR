import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class ReferFriendScreen extends StatelessWidget {
  const ReferFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REFERRAL NETWORK', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Column(
          children: [
            // Hero Icon
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: AppTheme.backgroundWhite,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.primaryRed.withValues(alpha: 0.1), width: 10),
              ),
              child: const Icon(Icons.auto_awesome_outlined, size: 80, color: AppTheme.primaryRed),
            ).animate().scale(duration: 1.seconds, curve: Curves.elasticOut),
            
            const SizedBox(height: 60),
            Text(
              'GIVE \$50, GET \$50',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 32),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms),
            
            const SizedBox(height: 16),
            Text(
              'Invite your inner circle to the AR Collection. When they make their first purchase, you both receive a concierge credit.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], height: 1.6, fontSize: 14),
            ).animate().fadeIn(delay: 400.ms),
            
            const SizedBox(height: 60),
            
            // Referral Code Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              decoration: BoxDecoration(
                color: AppTheme.matteBlack,
                borderRadius: BorderRadius.zero,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('YOUR UNIQUE CODE', style: TextStyle(color: AppTheme.primaryRed, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
                      SizedBox(height: 4),
                      Text('SOPHIA-RED-2026', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy_all, color: Colors.white, size: 20),
                    onPressed: () {},
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1, end: 0),
            
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {},
              child: const Text('INVITE COLLEAGUES'),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {},
              child: const Text('TERMS & CONDITIONS', style: TextStyle(color: Colors.grey, fontSize: 11, letterSpacing: 1, decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    );
  }
}

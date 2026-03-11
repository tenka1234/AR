import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'THE RUNWAY AT YOUR FINGERTIPS',
      'desc': 'Exclusive collections curated for the modern, independent woman.',
      'img': 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=1000'
    },
    {
      'title': 'EDITORIAL SELECTIONS',
      'desc': 'Hand-picked luxury items that define current global trends.',
      'img': 'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=1000'
    },
    {
      'title': 'SEAMLESS EXPERIENCE',
      'desc': 'Sophisticated shopping tailored to your high-performance lifestyle.',
      'img': 'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=1000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.matteBlack,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (idx) => setState(() => _currentPage = idx),
            itemCount: _pages.length,
            itemBuilder: (context, idx) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    _pages[idx]['img']!,
                    fit: BoxFit.cover,
                  ).animate().scale(begin: const Offset(1.1, 1.1), end: const Offset(1, 1), duration: 10.seconds),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppTheme.matteBlack.withValues(alpha: 0.9),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _pages[idx]['title']!,
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ).animate().fadeIn(duration: 800.ms).slideX(begin: -20, end: 0),
                        const SizedBox(height: 16),
                        Text(
                          _pages[idx]['desc']!,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white70,
                          ),
                        ).animate().fadeIn(delay: 300.ms),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 60,
            left: 40,
            right: 40,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(_pages.length, (idx) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 2,
                    width: _currentPage == idx ? 40 : 12,
                    decoration: BoxDecoration(
                      color: _currentPage == idx ? AppTheme.primaryRed : Colors.white24,
                    ),
                  )).animate(onPlay: (controller) => controller.repeat()).shimmer(delay: 2.seconds),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppTheme.matteBlack,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        onPressed: () => context.go('/login'),
                        child: const Text('GET STARTED'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class StyleQuizScreen extends StatefulWidget {
  const StyleQuizScreen({super.key});

  @override
  State<StyleQuizScreen> createState() => _StyleQuizScreenState();
}

class _StyleQuizScreenState extends State<StyleQuizScreen> {
  int _currentStep = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'q': 'CHOOSE YOUR AESTHETIC',
      'options': [
        {'title': 'MINIMALIST', 'img': 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1000'},
        {'title': 'BOHEMIAN', 'img': 'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=1000'},
        {'title': 'AVANT-GARDE', 'img': 'https://images.unsplash.com/photo-1544441893-675973e31985?q=80&w=1000'},
      ]
    },
    {
      'q': 'PREFERRED PALETTE',
      'options': [
        {'title': 'MONOCHROME', 'color': Colors.black},
        {'title': 'EARTH TONES', 'color': Colors.brown},
        {'title': 'VIBRANT', 'color': AppTheme.primaryRed},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('STYLE QUIZ', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: LinearProgressIndicator(
            value: (_currentStep + 1) / _questions.length,
            backgroundColor: Colors.grey[100],
            valueColor: const AlwaysStoppedAnimation(AppTheme.primaryRed),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _questions[_currentStep]['q'],
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
            ).animate().fadeIn().slideY(begin: 0.1, end: 0),
            const SizedBox(height: 48),
            Expanded(
              child: ListView.builder(
                itemCount: (_questions[_currentStep]['options'] as List).length,
                itemBuilder: (context, idx) {
                  final opt = (_questions[_currentStep]['options'] as List)[idx];
                  return GestureDetector(
                    onTap: () {
                      if (_currentStep < _questions.length - 1) {
                        setState(() => _currentStep++);
                      } else {
                        context.go('/');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundWhite,
                        image: opt['img'] != null ? DecorationImage(image: NetworkImage(opt['img']), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.3), BlendMode.darken)) : null,
                        border: opt['color'] != null ? Border.all(color: Colors.grey[200]!) : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        opt['title'],
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3, fontSize: 13),
                      ),
                    ),
                  ).animate().fadeIn(delay: (idx * 100).ms).slideX(begin: 0.1, end: 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

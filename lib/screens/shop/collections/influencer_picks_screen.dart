import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfluencerPicksScreen extends StatelessWidget {
  const InfluencerPicksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFLUENCER EDITS', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(32),
        itemCount: 4,
        itemBuilder: (context, index) {
          final names = ['SOPHIA REYNOLDS', 'CAMILLE DERIVIERE', 'ELENA ROSSI', 'MARIA VOGUE'];
          return Container(
            margin: const EdgeInsets.only(bottom: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=1000'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black87],
                          ),
                        ),
                        child: Text(
                          names[index],
                          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('"${names[index].split(' ')[0]}\'S CURATED SELECTION FOR THE PARIS ARRIVAL."', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[600], fontSize: 13, height: 1.5)),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('SHOP THE LOOK'),
                ),
              ],
            ),
          ).animate().fadeIn(delay: (index * 200).ms).slideY(begin: 0.1, end: 0);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class InformationScreen extends StatelessWidget {
  final String title;
  final String slug;

  const InformationScreen({super.key, required this.title, required this.slug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined, size: 20), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              color: AppTheme.matteBlack,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THE LEGAL EDIT',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.primaryRed, fontSize: 11),
                  ).animate().fadeIn(duration: 800.ms).slideX(begin: -10, end: 0),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white, fontSize: 32),
                  ).animate().fadeIn(delay: 200.ms).slideX(begin: -10, end: 0),
                  const SizedBox(height: 16),
                  Container(height: 2, width: 40, color: AppTheme.primaryRed),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   _buildParagraph(
                    'TRANSPARENCY & EXCELLENCE',
                    'At AR Collections, we believe that luxury is built on trust. This official $title document reflects our commitment to providing a secure and transparent experience for the modern, independent woman.'
                  ).animate().fadeIn(delay: 400.ms),
                  
                  const SizedBox(height: 48),
                  
                  _buildSection(
                    '01. CORE STANDARDS',
                    'Our $slug protocols are governed by international retail standards. We ensure that every interaction meets the highest ethical and legal requirements expected of a premium fashion brand.'
                  ).animate().fadeIn(delay: 600.ms),
                  
                  const SizedBox(height: 40),
                  
                  _buildSection(
                    '02. CLIENT PROTECTION',
                    'We implement state-of-the-art encryption and procedural safeguards. Your security and satisfaction are non-negotiable pillars of our service architecture.'
                  ).animate().fadeIn(delay: 800.ms),
                  
                  const SizedBox(height: 60),
                  
                  Text(
                    'LAST UPDATED: FEBRUARY 20, 2026',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(String subtitle, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        Text(text, style: TextStyle(height: 1.8, fontSize: 15, color: Colors.grey[700])),
      ],
    );
  }

  Widget _buildSection(String number, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primaryRed, letterSpacing: 1)),
        const SizedBox(height: 12),
        Text(text, style: TextStyle(height: 1.8, fontSize: 14, color: Colors.grey[800])),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HELP CENTER')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('How can we help you?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildFaqItem('How do I track my order?', 'You can track your order in the My Orders section of your profile.'),
          _buildFaqItem('What is the return policy?', 'We offer a 30-day return policy for unused items with original tags.'),
          _buildFaqItem('Do you ship internationally?', 'Yes, we ship to over 50 countries worldwide.'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('CONTACT SUPPORT'),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return ExpansionTile(
      title: Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(answer, style: TextStyle(color: Colors.grey[700])),
        ),
      ],
    );
  }
}

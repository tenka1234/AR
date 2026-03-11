import 'package:flutter/material.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WRITE A REVIEW')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Text('Rate your experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 40),
                Icon(Icons.star, color: Colors.amber, size: 40),
                Icon(Icons.star, color: Colors.amber, size: 40),
                Icon(Icons.star, color: Colors.amber, size: 40),
                Icon(Icons.star_border, color: Colors.grey, size: 40),
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Tell us what you liked or disliked...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('SUBMIT REVIEW'),
            ),
          ],
        ),
      ),
    );
  }
}

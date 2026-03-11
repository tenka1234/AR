import 'package:flutter/material.dart';

class RefundRequestScreen extends StatelessWidget {
  const RefundRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REQUEST REFUND')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Tell us why you want a refund', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildReasonTile('Item arrived damaged'),
            _buildReasonTile('Wrong item received'),
            _buildReasonTile('Changed my mind'),
            const Spacer(),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('SUBMIT REQUEST')),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonTile(String text) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }
}

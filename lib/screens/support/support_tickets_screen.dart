import 'package:flutter/material.dart';

class SupportTicketsScreen extends StatelessWidget {
  const SupportTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MY TICKETS')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(index == 0 ? Icons.check_circle : Icons.pending, color: index == 0 ? Colors.green : Colors.orange),
              title: Text('Issue with Payment #${1024 + index}'),
              subtitle: Text(index == 0 ? 'Resolved' : 'In Progress'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../theme.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EDIT PROFILE')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.lightGrey,
              child: Icon(Icons.camera_alt, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _buildField('Full Name', 'AR User'),
            const SizedBox(height: 20),
            _buildField('Email', 'user@arcollections.com'),
            const SizedBox(height: 20),
            _buildField('Phone', '+1 234 567 8900'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('SAVE CHANGES'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String value) {
    return TextField(
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

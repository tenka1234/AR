import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('404', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: AppTheme.primaryRed)),
            const Text('Oops! This page is out of style.', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () => context.go('/'), child: const Text('GO HOME')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../theme.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.settings, size: 80, color: AppTheme.primaryRed),
              const SizedBox(height: 20),
              const Text('Maintenance Ready', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('We are upgrading our stylish servers. We will be back soon with more fashion!', textAlign: TextAlign.center),
              const SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: const Text('REFRESH')),
            ],
          ),
        ),
      ),
    );
  }
}

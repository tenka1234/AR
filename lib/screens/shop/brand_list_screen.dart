import 'package:flutter/material.dart';

class BrandListScreen extends StatelessWidget {
  const BrandListScreen({super.key});

  final List<String> brands = const [
    'AR Exclusive', 'Elite Wear', 'Urban Chic', 'Glow Fashion', 
    'Velvet Dreams', 'Aura Styles', 'Nova Couture', 'Ethereal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SHOP BY BRAND')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: brands.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(brands[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          );
        },
      ),
    );
  }
}

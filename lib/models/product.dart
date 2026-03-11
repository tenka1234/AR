import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> sizes;
  final List<Color> colors;
  final String category;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.colors,
    required this.category,
    this.rating = 4.5,
  });
}

List<Product> demoProducts = [
  Product(
    id: '1',
    name: 'Red Velvet Party Dress',
    description: 'A beautiful red velvet dress perfect for parties and special occasions. Features a comfortable fit and elegant design.',
    price: 45.99,
    imageUrl: 'https://images.unsplash.com/photo-1518831959646-742c3a14ebf7?auto=format&fit=crop&q=80&w=1000',
    sizes: ['S', 'M', 'L', 'XL'],
    colors: [Colors.red, Colors.black],
    category: 'Dresses',
  ),
  Product(
    id: '2',
    name: 'Black Lace Top',
    description: 'Elegant black lace top for a sophisticated look. Made with high-quality lace and breathable fabric.',
    price: 29.99,
    imageUrl: 'https://images.unsplash.com/photo-1539109132314-34a7795ee12f?auto=format&fit=crop&q=80&w=1000',
    sizes: ['XS', 'S', 'M'],
    colors: [Colors.black, Colors.white],
    category: 'Tops',
  ),
  Product(
    id: '3',
    name: 'White Summer Skirt',
    description: 'Lightweight white skirt ideal for summer outings. Flowy material that keeps you cool and stylish.',
    price: 34.50,
    imageUrl: 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&q=80&w=1000',
    sizes: ['S', 'M', 'L'],
    colors: [Colors.white, Colors.red],
    category: 'Skirts',
  ),
  Product(
    id: '4',
    name: 'Red Leather Jacket',
    description: 'Stylish red leather jacket for a bold statement. Durable and trendy for any outfit.',
    price: 89.99,
    imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&q=80&w=1000',
    sizes: ['M', 'L', 'XL'],
    colors: [Colors.red, Colors.black],
    category: 'Outwear',
  ),
];

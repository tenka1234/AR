import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import 'package:flutter/material.dart';

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) {
          return Product(
            id: json['id'].toString(),
            name: json['title'],
            description: json['description'],
            price: (json['price'] as num).toDouble(),
            imageUrl: json['image'],
            sizes: ['XS', 'S', 'M', 'L', 'XL'],
            colors: [Colors.red, Colors.black, Colors.white],
            category: _mapCategory(json['category']),
            rating: (json['rating']['rate'] as num).toDouble(),
          );
        }).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      // Fallback to demo products if API fails
      return demoProducts;
    }
  }

  static String _mapCategory(String apiCategory) {
    if (apiCategory.contains('women')) return 'Women';
    if (apiCategory.contains('men')) return 'Men';
    if (apiCategory.contains('jewelery')) return 'Accessories';
    return 'Fashion';
  }
}

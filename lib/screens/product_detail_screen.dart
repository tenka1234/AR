import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../theme.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? selectedSize;
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product.sizes[0];
    selectedColor = widget.product.colors[0];
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppTheme.matteBlack),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined, size: 22, color: AppTheme.matteBlack),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined, size: 22, color: AppTheme.matteBlack),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Immersive Gallery
            SliverGallery(imageUrl: widget.product.imageUrl),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.category.toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ).animate().fadeIn().moveX(begin: -10, end: 0),
                  const SizedBox(height: 12),
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.displayLarge,
                  ).animate().fadeIn(delay: 200.ms),
                  const SizedBox(height: 16),
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppTheme.matteBlack),
                  ).animate().fadeIn(delay: 300.ms),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Divider(),
                  ),

                  _buildSelectionLabel('SELECT COLOR'),
                  const SizedBox(height: 16),
                  _buildColorSelector(),
                  
                  const SizedBox(height: 32),
                  _buildSelectionLabel('SELECT SIZE'),
                  const SizedBox(height: 16),
                  _buildSizeSelector(),

                  const SizedBox(height: 48),
                  Text(
                    'THE DETAIL',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.matteBlack),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.product.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomAction(context, cart),
    );
  }

  Widget _buildSelectionLabel(String label) {
    return Text(
      label,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.grey),
    );
  }

  Widget _buildColorSelector() {
    return Row(
      children: widget.product.colors.map((color) {
        bool isSelected = selectedColor == color;
        return GestureDetector(
          onTap: () => setState(() => selectedColor = color),
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected ? Border.all(color: AppTheme.matteBlack, width: 1.5) : null,
            ),
            child: CircleAvatar(radius: 14, backgroundColor: color),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSizeSelector() {
    return Wrap(
      spacing: 12,
      children: widget.product.sizes.map((size) {
        bool isSelected = selectedSize == size;
        return GestureDetector(
          onTap: () => setState(() => selectedSize = size),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.matteBlack : Colors.white,
              border: Border.all(color: isSelected ? AppTheme.matteBlack : Colors.grey[300]!),
            ),
            child: Text(
              size,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.matteBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomAction(BuildContext context, CartProvider cart) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.matteBlack,
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
        onPressed: () {
          cart.addToCart(widget.product, size: selectedSize, color: selectedColor);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to your collection')),
          );
        },
        child: const Text('ADD TO BAG'),
      ),
    );
  }
}

class SliverGallery extends StatelessWidget {
  final String imageUrl;
  const SliverGallery({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'product_image',
      child: AspectRatio(
        aspectRatio: 3/4,
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

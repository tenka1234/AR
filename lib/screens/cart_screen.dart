import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/cart_provider.dart';
import '../theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR COLLECTION', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14)),
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_bag_outlined, size: 60, color: Colors.grey),
                  const SizedBox(height: 24),
                  Text('YOUR BAG IS CURRENTLY EMPTY', style: Theme.of(context).textTheme.bodyLarge?.copyWith(letterSpacing: 1.5)),
                  const SizedBox(height: 32),
                  OutlinedButton(
                    onPressed: () => context.go('/'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      side: const BorderSide(color: AppTheme.matteBlack),
                    ),
                    child: const Text('EXPLORE THE EDIT'),
                  ),
                ],
              ),
            ).animate().fadeIn()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(24),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 130,
                              decoration: BoxDecoration(
                                color: AppTheme.backgroundWhite,
                                image: DecorationImage(
                                  image: NetworkImage(item.product.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.name.toUpperCase(),
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'SIZE: ${item.selectedSize}  |  COLOR: ${_getColorName(item.selectedColor)}',
                                    style: const TextStyle(fontSize: 11, color: Colors.grey, letterSpacing: 1),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      _QuantityAdjuster(
                                        quantity: item.quantity,
                                        onDecrease: () => cart.updateQuantity(item.product.id, item.quantity - 1),
                                        onIncrease: () => cart.updateQuantity(item.product.id, item.quantity + 1),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  TextButton(
                                    onPressed: () => cart.removeItem(item.product.id),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text('REMOVE', style: TextStyle(color: Colors.grey, fontSize: 10, decoration: TextDecoration.underline)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.05, end: 0);
                    },
                  ),
                ),
                _buildSummary(context, cart),
              ],
            ),
    );
  }

  String _getColorName(Color? color) {
    if (color == Colors.black) return 'BLACK';
    if (color == Colors.white) return 'WHITE';
    if (color == AppTheme.primaryRed) return 'CRIMSON';
    return 'STANDARD';
  }

  Widget _buildSummary(BuildContext context, CartProvider cart) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 48),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('TOTAL', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2)),
              Text(
                '\$${cart.totalAmount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => context.push('/checkout/shipping'),
            child: const Text('PROCEED TO CHECKOUT'),
          ),
        ],
      ),
    );
  }
}

class _QuantityAdjuster extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const _QuantityAdjuster({
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CircleButton(icon: Icons.remove, onTap: onDecrease),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('$quantity', style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        _CircleButton(icon: Icons.add, onTap: onIncrease),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(icon, size: 14, color: AppTheme.matteBlack),
      ),
    );
  }
}

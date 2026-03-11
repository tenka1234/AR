import 'package:flutter/material.dart';
import '../../theme.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHIPPING ADDRESSES', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildAddressCard('RESIDENCE', 'SOPHIA REYNOLDS', '123 AVENUE DES CHAMPS-ÉLYSÉES\n75008 PARIS, FRANCE', true),
                const SizedBox(height: 24),
                _buildAddressCard('STUDIO', 'SOPHIA REYNOLDS', '45 RUE DU FAUBOURG SAINT-HONORÉ\n75008 PARIS, FRANCE', false),
              ],
            ),
          ),
          _buildBottomAction(),
        ],
      ),
    );
  }

  Widget _buildAddressCard(String label, String name, String address, bool isDefault) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDefault ? AppTheme.matteBlack : Colors.white,
        border: Border.all(color: isDefault ? AppTheme.matteBlack : Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 10, 
                letterSpacing: 2,
                color: isDefault ? AppTheme.primaryRed : Colors.grey[400]
              )),
              if (isDefault) const Icon(Icons.check_circle, color: AppTheme.primaryRed, size: 16),
            ],
          ),
          const SizedBox(height: 20),
          Text(name, style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16,
            color: isDefault ? Colors.white : AppTheme.matteBlack,
          )),
          const SizedBox(height: 8),
          Text(address, style: TextStyle(
            height: 1.6,
            color: isDefault ? Colors.white70 : Colors.grey[600],
            fontSize: 13,
          )),
          const SizedBox(height: 24),
          Row(
            children: [
              _ActionButton('EDIT', isDefault ? Colors.white70 : Colors.grey),
              const SizedBox(width: 24),
              _ActionButton('REMOVE', isDefault ? Colors.white70 : Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 48),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, -10)),
        ],
      ),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppTheme.matteBlack, width: 1.5),
        ),
        child: const Text('ADD NEW ADDRESS'),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  const _ActionButton(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: color, 
      fontWeight: FontWeight.bold, 
      fontSize: 10, 
      letterSpacing: 1.5,
      decoration: TextDecoration.underline,
    ));
  }
}

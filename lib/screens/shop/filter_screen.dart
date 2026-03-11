import 'package:flutter/material.dart';
import '../../theme.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRange = const RangeValues(0, 1000);
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL'];
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FILTERS')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 1000,
              divisions: 20,
              activeColor: AppTheme.primaryRed,
              labels: RangeLabels('\$${_priceRange.start.round()}', '\$${_priceRange.end.round()}'),
              onChanged: (vals) => setState(() => _priceRange = vals),
            ),
            const SizedBox(height: 30),
            const Text('Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 15),
            Wrap(
              spacing: 12,
              children: _sizes.map((size) {
                final isSelected = _selectedSize == size;
                return ChoiceChip(
                  label: Text(size),
                  selected: isSelected,
                  selectedColor: AppTheme.secondaryBlack,
                  labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                  onSelected: (val) => setState(() => _selectedSize = size),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('APPLY FILTERS'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<String> _trending = ['WEDDING GUESTS', 'PARISIAN CHIC', 'THE ARCHIVE', 'RESORT 26', 'COUTURE TAILORING'];
  final List<Map<String, String>> _categories = [
    {'name': 'EVENING GOWNS', 'count': '1,240'},
    {'name': 'ARCHITECTURAL TOPS', 'count': '840'},
    {'name': 'LUXURY EYEWEAR', 'count': '420'},
    {'name': 'BESPOKE FOOTWEAR', 'count': '960'},
    {'name': 'HIGH JEWELRY', 'count': '310'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(fontSize: 14, letterSpacing: 1),
          decoration: InputDecoration(
            hintText: 'SEARCH THE 200 COLLECTIONS...',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13, letterSpacing: 1),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 20),
            onPressed: () => _searchController.clear(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TRENDING DISCOVERIES', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.primaryRed, fontSize: 10, letterSpacing: 2)),
            Wrap(
              spacing: 12,
              runSpacing: 16,
              children: _trending.map((item) => GestureDetector(
                onTap: () => context.push('/occasion/${item.toLowerCase().replaceAll(' ', '-')}-0'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundWhite,
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Text(item, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 1)),
                ),
              ).animate().fadeIn()).toList(),
            ),
            
            const SizedBox(height: 60),
            Text('DEEP CATALOG NODES', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppTheme.primaryRed, fontSize: 10, letterSpacing: 2)),
            const SizedBox(height: 24),
            ..._categories.map((cat) => _buildCategoryRow(context, cat['name']!, cat['count']!)),
            
            const SizedBox(height: 60),
            _buildBoutiqueInvite(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(BuildContext context, String title, String count) {
    return Column(
      children: [
        ListTile(
          onTap: () => context.push('/category/${title.toLowerCase().replaceAll(' ', '-')}'),
          contentPadding: EdgeInsets.zero,
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, letterSpacing: 1.5)),
          subtitle: Text('$count CURATED PIECES', style: TextStyle(fontSize: 9, color: Colors.grey[400], letterSpacing: 1)),
          trailing: const Icon(Icons.arrow_forward, size: 16, color: AppTheme.matteBlack),
        ),
        const Divider(height: 32, thickness: 0.5),
      ],
    ).animate().fadeIn();
  }

  Widget _buildBoutiqueInvite(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      color: AppTheme.matteBlack,
      child: Column(
        children: [
          const Icon(Icons.auto_awesome, color: AppTheme.primaryRed, size: 32),
          const SizedBox(height: 24),
          const Text(
            'CAN\'T FIND YOUR FIT?',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 3),
          ),
          const SizedBox(height: 12),
          Text(
            'CONSULT OUR VIRTUAL CONCIERGE FOR A TAILORED SELECTION.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 10, height: 1.6, letterSpacing: 1),
          ),
          const SizedBox(height: 32),
          OutlinedButton(
            onPressed: () => context.push('/support/chat-live'),
            style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white, width: 0.5)),
            child: const Text('OPEN CONCIERGE', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms);
  }
}

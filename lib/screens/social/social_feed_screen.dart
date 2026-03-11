import 'package:flutter/material.dart';
import '../../theme.dart';

class SocialFeedScreen extends StatelessWidget {
  const SocialFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR COMMUNITY')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                const ListTile(
                  leading: CircleAvatar(backgroundColor: AppTheme.secondaryBlack),
                  title: Text('style_icon_maria'),
                  subtitle: Text('2 hours ago'),
                ),
                Container(height: 250, color: AppTheme.lightGrey),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Absolutely loving my new AR Collections summer set! #Fashion #ARStyles'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

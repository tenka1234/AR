import 'package:flutter/material.dart';
import '../../theme.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NOTIFICATIONS')),
      body: ListView(
        children: [
          _buildSwitch('Order Updates', true),
          _buildSwitch('New Arrivals', true),
          _buildSwitch('Promotions', false),
          _buildSwitch('Personalized Offers', true),
        ],
      ),
    );
  }

  Widget _buildSwitch(String title, bool val) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      value: val,
      onChanged: (v) {},
      activeThumbColor: AppTheme.primaryRed,
      activeTrackColor: AppTheme.primaryRed.withValues(alpha: 0.5),
    );
  }
}

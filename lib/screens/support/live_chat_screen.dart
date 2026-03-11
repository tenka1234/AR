import 'package:flutter/material.dart';
import '../../theme.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('LIVE CONCIERGE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                const Text('AGENT ONLINE', style: TextStyle(fontSize: 8, color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(32),
              children: [
                _buildMessage('BONJOUR SOPHIA, HOW MAY I ASSIST YOUR WARDROBE TODAY?', false),
                _buildMessage('I NEED TO UPDATE MY SHIPPING ADDRESS FOR ORDER #AR-202488.', true),
                _buildMessage('CERTAINLY. I AM UPDATING YOUR LOGISTICS PROFILE NOW. ONE MOMENT PLEASE.', false),
              ],
            ),
          ),
          _buildInputArea(context),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isMe) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: isMe ? AppTheme.matteBlack : AppTheme.backgroundWhite,
              border: isMe ? null : Border.all(color: Colors.grey[200]!),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : AppTheme.matteBlack,
                fontSize: 13,
                height: 1.5,
                fontWeight: isMe ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isMe ? 'DELIVERED 14:00' : 'ASSISTANT 14:01',
            style: TextStyle(fontSize: 8, color: Colors.grey[400], fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, -10)),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'TYPE YOUR INQUIRY...',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                fillColor: Colors.transparent,
              ),
              style: TextStyle(fontSize: 13, letterSpacing: 1),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send_sharp, color: AppTheme.primaryRed, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

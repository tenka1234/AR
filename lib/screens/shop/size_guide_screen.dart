import 'package:flutter/material.dart';

class SizeGuideScreen extends StatelessWidget {
  const SizeGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIZE GUIDE')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Find your perfect fit', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(color: Colors.grey[300]!),
              children: const [
                TableRow(children: [
                  _Cell('Size', isHeader: true),
                  _Cell('Bust (in)', isHeader: true),
                  _Cell('Waist (in)', isHeader: true),
                  _Cell('Hips (in)', isHeader: true),
                ]),
                TableRow(children: [_Cell('XS'), _Cell('32'), _Cell('24'), _Cell('34')]),
                TableRow(children: [_Cell('S'), _Cell('34'), _Cell('26'), _Cell('36')]),
                TableRow(children: [_Cell('M'), _Cell('36'), _Cell('28'), _Cell('38')]),
                TableRow(children: [_Cell('L'), _Cell('38'), _Cell('30'), _Cell('40')]),
                TableRow(children: [_Cell('XL'), _Cell('40'), _Cell('32'), _Cell('42')]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;
  final bool isHeader;
  const _Cell(this.text, {this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

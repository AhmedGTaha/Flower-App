import 'package:flutter/material.dart';
import '../models/flower_item.dart';

class ExtraPage extends StatelessWidget {
  const ExtraPage({super.key});

  @override
  Widget build(BuildContext context) {
    final total = FlowerItem.items.length;
    final available = FlowerItem.items.where((f) => f.available).length;
    final avgPrice = total > 0
        ? FlowerItem.items.map((f) => f.price).reduce((a, b) => a + b) / total
        : 0.0;
    final avgDiscount = total > 0
        ? FlowerItem.items.map((f) => f.discount).reduce((a, b) => a + b) / total
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Flower Statistics',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            _StatCard(
                icon: Icons.local_florist,
                label: 'Total Flowers',
                value: '$total'),
            _StatCard(
                icon: Icons.check_circle,
                label: 'Available',
                value: '$available'),
            _StatCard(
                icon: Icons.attach_money,
                label: 'Average Price',
                value: 'BD ${avgPrice.toStringAsFixed(2)}'),
            _StatCard(
                icon: Icons.percent,
                label: 'Average Discount',
                value: '${avgDiscount.toStringAsFixed(1)}%'),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey, size: 30),
        title: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.blueGrey)),
        trailing: Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueGrey)),
      ),
    );
  }
}

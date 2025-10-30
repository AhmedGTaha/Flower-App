import 'package:flutter/material.dart';
import '../models/flower_item.dart';

class DetailPage extends StatefulWidget {
  final FlowerItem item;
  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _scale = 1.0;
  bool _showPrice = false;
  bool _counting = false;
  int _remaining = 10;

  double get _discounted => widget.item.finalPrice;

  void _togglePrice() async {
    if (_showPrice) {
      setState(() {
        _showPrice = false;
        _counting = false;
        _remaining = 10;
      });
      return;
    }

    setState(() {
      _showPrice = true;
      _counting = true;
      _remaining = 10;
    });

    while (_counting && _remaining > 0) {
      await Future.delayed(const Duration(seconds: 1));
      if (!_counting || !mounted) return;
      setState(() => _remaining--);
    }

    if (!mounted) return;
    setState(() {
      _counting = false;
      _remaining = 10;
    });
  }

  @override
  void dispose() {
    _counting = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Detail Page', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 280,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: Transform.scale(
                        scale: _scale,
                        child: Image.asset(item.image, fit: BoxFit.contain),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Text('Size'),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.green,
                        thumbColor: Colors.green,
                        value: _scale,
                        min: 1.0,
                        max: 4.0,
                        divisions: 4,
                        label: _scale.toStringAsFixed(1),
                        onChanged: (v) => setState(() => _scale = v),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: _togglePrice,
                child: Text(_showPrice ? 'Hide Price' : 'Show'),
              ),
              const SizedBox(height: 8),
              if (_showPrice)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Original price: BD ${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500)),
                      Text(
                          'Discounted price: BD ${_discounted.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500)),
                      Text('Timer: $_remaining s',
                          style: const TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

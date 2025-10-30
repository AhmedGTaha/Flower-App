import 'package:flutter/material.dart';
import '../models/flower_item.dart';

class FormPage extends StatefulWidget {
  final FlowerItem? editItem;
  final int? editIndex;
  const FormPage({super.key, this.editItem, this.editIndex});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _catCtrl = TextEditingController();
  final _imageCtrl = TextEditingController();

  String? _selectedColor;
  double _discount = 0;
  bool _available = true;

  final List<String> _colors = const [
    'Red',
    'Blue',
    'Yellow',
    'White',
    'Pink',
    'Unknown'
  ];

  @override
  void initState() {
    super.initState();
    final item = widget.editItem;
    if (item != null) {
      _nameCtrl.text = item.name;
      _descCtrl.text = item.description;
      _priceCtrl.text = item.price.toStringAsFixed(2);
      _catCtrl.text = item.category;
      _imageCtrl.text = item.image;
      _selectedColor = item.colorName;
      _discount = item.discount;
      _available = item.available;
    } else {
      _imageCtrl.text = 'images/Flower4.jpg';
      _selectedColor = _colors.last;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    _priceCtrl.dispose();
    _catCtrl.dispose();
    _imageCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final newItem = FlowerItem(
      name: _nameCtrl.text.trim(),
      description: _descCtrl.text.trim(),
      price: double.tryParse(_priceCtrl.text.trim()) ?? 0,
      category: _catCtrl.text.trim(),
      colorName: _selectedColor ?? 'Unknown',
      image: _imageCtrl.text.trim(),
      discount: _discount,
      available: _available,
    );
    if (widget.editIndex != null) {
      FlowerItem.items[widget.editIndex!] = newItem;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Flower updated')));
    } else {
      FlowerItem.items.add(newItem);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Flower added')));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.blue),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          floatingLabelStyle: TextStyle(color: Colors.blue),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Flower App', style: TextStyle(color: Colors.white)),
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Flower Name'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Name is required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descCtrl,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Description is required'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Price is required';
                  final p = double.tryParse(v);
                  if (p == null) return 'Enter a valid number';
                  if (p < 0) return 'Price must be positive';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _catCtrl,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Color'),
                trailing: DropdownButton<String>(
                  value: _selectedColor,
                  hint: const Text('Select Color'),
                  items: _colors
                      .map((color) => DropdownMenuItem<String>(
                            value: color,
                            child: Text(color),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedColor = value),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _imageCtrl,
                decoration: const InputDecoration(
                    labelText: 'Image (asset path, e.g. images/Flower1.jpg)'),
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Discount: ${_discount.toStringAsFixed(0)}%'),
                  Slider(
                    thumbColor: Colors.blue,
                    activeColor: Colors.blue,
                    value: _discount,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: '${_discount.toStringAsFixed(0)}%',
                    onChanged: (v) => setState(() => _discount = v),
                  ),
                ],
              ),
              SwitchListTile(
                inactiveThumbColor: Colors.red,
                activeThumbColor: Colors.blue,
                title: const Text('Available'),
                value: _available,
                onChanged: (v) => setState(() => _available = v),
              ),
              const SizedBox(height: 12),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: _save,
                child: Text(widget.editItem == null
                    ? 'Add Flower'
                    : 'Update Flower'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

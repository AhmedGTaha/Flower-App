import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(const FlowerApp());

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flower App',
      home: HomePage(),
    );
  }
}

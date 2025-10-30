import 'package:flutter/material.dart';
import '../models/flower_item.dart';
import '../pages/form_page.dart';
import '../pages/list_page.dart';
import '../pages/detail_page.dart';
import '../pages/extra_page.dart';
import '../widgets/home_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            HomeButton(
              color: Colors.blue,
              icon: Icons.note_add,
              label: 'Form',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FormPage()),
              ),
            ),
            HomeButton(
              color: Colors.orange,
              icon: Icons.list,
              label: 'List',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ListPage()),
              ),
            ),
            HomeButton(
              color: Colors.green,
              icon: Icons.photo,
              label: 'Detail',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(item: FlowerItem.items.first),
                ),
              ),
            ),
            HomeButton(
              color: Colors.blueGrey,
              icon: Icons.edit,
              label: 'Extra',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ExtraPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

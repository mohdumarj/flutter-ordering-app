import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String description;

  const MenuItemCard({super.key, 
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      child: ListTile(
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Text(
                price,//'\OMR${price.toStringAsFixed(3)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
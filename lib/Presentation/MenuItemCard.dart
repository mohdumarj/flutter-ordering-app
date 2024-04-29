import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String name;
  final double price;
  final String description;

  MenuItemCard({
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 4,
      child: ListTile(
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Text(
              '\OMR${price.toStringAsFixed(3)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
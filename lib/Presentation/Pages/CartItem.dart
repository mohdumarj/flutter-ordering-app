import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Assuming CartItem is defined somewhere in your code. Here's a simple example:
class CartItem extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final int quantity;

  const CartItem({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemName),
          Text('\$$itemPrice x $quantity'),
        ],
      ),
    );
  }
}
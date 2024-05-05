import 'package:flutter/material.dart';

import 'CartItem.dart';

// import 'Presentation/CartItem.dart';

class CartPage extends StatelessWidget {
  // Example list of items in the cart
  final List<CartItem> items = [
    const CartItem(itemName: 'Cheeseburger', itemPrice: 5.99, quantity: 2),
    const CartItem(itemName: 'French Fries', itemPrice: 2.49, quantity: 1),
    const CartItem(itemName: 'Cola', itemPrice: 1.99, quantity: 3),
  ];

  CartPage({super.key});

  double getTotalPrice() {
    double total = 0.0;
    for (var item in items) {
      total += item.itemPrice * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView(
        children: [
          ...items, // Spread the items list into the children array
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${getTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Proceed to checkout logic can be added here
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
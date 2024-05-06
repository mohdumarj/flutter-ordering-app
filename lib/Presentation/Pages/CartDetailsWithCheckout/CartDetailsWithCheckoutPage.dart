import 'package:flutter/material.dart';

import '../../../Entities/ShoppingCart.dart';
import '../../../Entities/UserCartItemModel.dart';

class CheckoutPage extends StatelessWidget {

  List<UserCartItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    final ShoppingCart cart = ShoppingCart(); // Access the singleton instance
    this.items = ShoppingCart().getItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Information
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Name: ${cart.getUserInformation().username}'),
                Text('Email: ${cart.getUserInformation().email}'),
                // Add more user information fields as needed
              ],
            ),
          ),
          // Cart Items
          Expanded(
            child: ListView.builder(
              itemCount: cart.getTotalItemCount(),//.items.length,
              itemBuilder: (context, index) {

                final item = items[index];
                return ListTile(
                  title: Text(item.menuItem!.name ?? "item"),
                  subtitle: Text(item.menuItem!.price ?? "0.0 AED" ),
                  // Add more item details as needed
                );
              },
            ),
          ),
          // Total Price
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \AEF${ShoppingCart().getItemsTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Checkout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implement checkout logic
                },
                child: Text('Proceed to Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CheckoutPage(),
  ));
}

import 'package:flutter/material.dart';

import '../../../Entities/ShoppingCart.dart';
import '../../../Entities/UserCartItemModel.dart';
import '../CheckOutRow/CheckOutRow.dart';

class CartDetailsWithCheckoutPage extends StatelessWidget {

  List<UserCartItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    final ShoppingCart cart = ShoppingCart();
    final totalPayable = cart.getItemsTotalPrice();// Access the singleton instance
    this.items = ShoppingCart().getItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4, // Adjust the elevation for a shadow effect
            margin: EdgeInsets.all(16), // Adjust the margin as needed
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Customer Name: ${cart.getUserInformation().username}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Email: ${cart.getUserInformation().email}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Cart Items
          Expanded(
            child: ListView.builder(
              itemCount: cart.getTotalItemCount(),//.items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return CheckOutRow().initMenuItemCard(item);
              },
            ),
          ),
          // Total Price
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \ORM${totalPayable.toStringAsFixed(2)}',
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
    home: CartDetailsWithCheckoutPage(),
  ));
}

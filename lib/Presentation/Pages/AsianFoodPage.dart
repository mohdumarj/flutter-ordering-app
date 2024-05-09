import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/BaitAlMadkohoutPage.dart';
import '../Pages/RestaurantLabelPage.dart';
import 'AccountPage.dart';
import 'CartDetailsWithCheckout/CartDetailsWithCheckoutPage.dart';
import 'UserManagement/CustomerUser/CustomerPage.dart';

class AsianFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asian Food'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the button if it's only one
          children: [
            RestaurantLabel(
              label: 'Bait Al Madkohout',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BaitAlMadkohoutPage()),
                );
              },
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Tooltip(
                message: 'Home',
                child: IconButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerPage()),
                    );
                  },
                  icon: Icon(Icons.home),
                ),
              ),
              Tooltip(
                message: 'Shopping Cart',
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartDetailsWithCheckoutPage()),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
              Tooltip(
                message: 'Account',
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountPage()),
                    );
                  },
                  icon: Icon(Icons.account_circle),
                ),
              ),
            ],
          ),
        )

    );
  }
}
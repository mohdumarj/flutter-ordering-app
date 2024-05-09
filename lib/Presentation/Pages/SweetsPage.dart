import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AccountPage.dart';
import 'Cafe42Page.dart';
import 'CartDetailsWithCheckout/CartDetailsWithCheckoutPage.dart';
import 'RestaurantLabelPage.dart';
import 'UserManagement/CustomerUser/CustomerPage.dart';

// import '../Cafe42Page.dart';
// import '../RestaurantLabelPage.dart';

class SweetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sweets'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the button if it's only one
          children: [
            RestaurantLabel(
              label: '42 Cafe',
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cafe42Page()),
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

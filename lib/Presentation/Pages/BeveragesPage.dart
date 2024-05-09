import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../BaithAlShaypage.dart';
// import '../Cafe42Page.dart';
import '../Pages/BaithAlShaypage.dart';
import '../Pages/Cafe42Page.dart';
import 'AccountPage.dart';
import 'CartDetailsWithCheckout/CartDetailsWithCheckoutPage.dart';
import 'RestaurantLabelPage.dart';
import 'UserManagement/CustomerUser/CustomerPage.dart';

class BeveragesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beverages'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RestaurantLabel(
              label: 'Baith Al Shay',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BaithAlShaypage()),
                );
              },
            ),
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

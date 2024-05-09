import 'package:flutter/material.dart';

// import '../BaithAlShaypage.dart';
// import '../NafahatBurgerPage.dart';
import '../Pages/BaithAlShaypage.dart';
import '../Pages/NafahatBurgerPage.dart';
import 'AccountPage.dart';
import 'CartDetailsWithCheckout/CartDetailsWithCheckoutPage.dart';
import 'RestaurantLabelPage.dart';
import 'UserManagement/CustomerUser/CustomerPage.dart';
class FastFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast Food'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Centers the buttons horizontally with even spacing
          children: [
            // RestaurantLabel(
            //   label: 'NAFAHAT BURGER',
            //   color: Colors.orange,
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => NafahatBurgerPage()),
            //     );
            //   },
            // ),
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

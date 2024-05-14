import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantMenuModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';
import 'package:untitled9/Entities/ShoppingCart.dart';

import '../../../Entities/UserCartItemModel.dart';
import '../AccountPage.dart';
import '../CartDetailsWithCheckout/CartDetailsWithCheckoutPage.dart';
import '../MenuItemCard.dart';
import '../UserManagement/CustomerUser/CustomerPage.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final RestaurantsModel restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.restaurant.name ?? "Selected Restaurant"),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    //CheckoutPage()
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartDetailsWithCheckoutPage()),
                    );
                  },
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      '${ShoppingCart().getTotalItemCount()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
                        'Address: ${widget.restaurant.address}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Email: ${widget.restaurant.email}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Phone Number: ${widget.restaurant.phoneNumber}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Website: ${widget.restaurant.website}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.restaurant.menusList.length,
                itemBuilder: (context, index) {
                  RestaurantMenuModel menu = widget.restaurant.menusList[index];
                  return ExpansionTile(
                    title: Text(menu.menuName ?? "Selected Menu"),
                    initiallyExpanded: true,
                    children: menu.menuItems!.map((item) {
                      UserCartItemModel userCartitem = UserCartItemModel(
                          resturantId: widget.restaurant.id, menuItem: item);
                      return MenuItemCard().initMenuItemCard(userCartitem);
                    }).toList(),
                  );
                },
              ),
            ),
          ],
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
                      MaterialPageRoute(
                          builder: (context) => CartDetailsWithCheckoutPage()),
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
        ));
  }
}

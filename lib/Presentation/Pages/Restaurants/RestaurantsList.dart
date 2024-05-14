import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

import '../../../Globals/Common/Globals.dart';
import '../AccountPage.dart';
import '../CartDetailsWithCheckout/CartDetailsWithCheckoutPage.dart';
import '../RestaurantLabelPage.dart';
import '../UserManagement/CustomerUser/CustomerPage.dart';
import 'RestaurantDetailScreen.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurant List'),
        ),
        body: StreamBuilder<List<RestaurantsModel>>(
            stream: _readRestaurantsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.isEmpty) {
                return Center(child: Text("No Data Yet"));
              }
              final restaurants = snapshot.data;
              Iterable<RestaurantLabel> restaurantLabels =
                  restaurants!.map((restaurant) {
                return RestaurantLabel(
                  label: restaurant.name!,
                  color: Globals().getRandomColor(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RestaurantDetailScreen(restaurant: restaurant)),
                    );
                  },
                );
              });
              List<Widget> restaurantWidgets = restaurantLabels.toList();
              child:
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      restaurantWidgets, // RestaurantLabel widgets as children
                ),
              );
            }),
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

  Stream<List<RestaurantsModel>> _readRestaurantsData() {
    try {
      final restaurantCollection =
          FirebaseFirestore.instance.collection("Restaurants");

      var result = restaurantCollection
          .snapshots()
          .map((qureySnapshot) => qureySnapshot.docs
              .map(
                (e) => RestaurantsModel.fromDocumentSnapshot(e),
              )
              .toList());

      return result;
    } catch (e) {
      print('Error fetching data: $e');
      return Stream<List<RestaurantsModel>>.empty();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Entities/RestaurantsModel.dart';
import '../../Globals/Common/Toast.dart';
import '../Pages/MenuItemCard.dart';

class NafahatBurgerPage extends StatefulWidget {
  final RestaurantsModel restaurant;

  const NafahatBurgerPage({super.key, required this.restaurant});

  @override
  State<NafahatBurgerPage> createState() => _NafahatBurgerPageState();
}

class _NafahatBurgerPageState extends State<NafahatBurgerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name ?? "Selected Restaurant"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Address: ${widget.restaurant.address}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Email: ${widget.restaurant.email}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Phone Number: ${widget.restaurant.phoneNumber}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Website: ${widget.restaurant.website}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Column(
              children: [
                MenuItemCard(
                  name: 'Fries',
                  price: "2.49",
                  description: 'Crispy golden fries.',
                ),
                MenuItemCard(
                  name: 'Soft Drink',
                  price: "1.99",
                  description: 'Refreshing soft drink.',
                ),
                MenuItemCard(
                  name: 'Pizza',
                  price: "8.99",
                  description: 'Classic pizza with your favorite toppings.',
                ),
                MenuItemCard(
                  name: 'Chicken Wings',
                  price: "6.99",
                  description: 'Spicy chicken wings served with dipping sauce.',
                ),
                MenuItemCard(
                  name: 'Salad',
                  price: "4.99",
                  description: 'Fresh garden salad with dressing of your choice.',
                ),
                MenuItemCard(
                  name: 'Hot Dog',
                  price: "3.99",
                  description: 'Classic hot dog with mustard and ketchup.',
                ),
                MenuItemCard(
                  name: 'Milkshake',
                  price: "3.49",
                  description: 'Creamy milkshake in your favorite flavor.',
                ),
                MenuItemCard(
                  name: 'Pasta',
                  price: "7.99",
                  description: 'Homemade pasta with marinara sauce.',
                ),
                MenuItemCard(
                  name: 'Sushi',
                  price: "9.99",
                  description: 'Fresh sushi rolls with soy sauce and wasabi.',
                ),
                MenuItemCard(
                  name: 'Steak',
                  price: "12.99",
                  description: 'Juicy steak cooked to perfection.',
                ),
                MenuItemCard(
                  name: 'Ice Cream',
                  price: "2.99",
                  description: 'Creamy ice cream in a variety of flavors.',
                ),
                MenuItemCard(
                  name: 'Tacos',
                  price: "5.99",
                  description: 'Tasty tacos with all the fixings.',
                ),
                MenuItemCard(
                  name: 'Sandwich',
                  price: "4.99",
                  description: 'Classic sandwich with your choice of fillings.',
                ),
                MenuItemCard(
                  name: 'Nachos',
                  price: "6.99",
                  description: 'Loaded nachos with cheese, salsa, and guacamole.',
                ),
                MenuItemCard(
                  name: 'Smoothie',
                  price: "3.99",
                  description: 'Refreshing fruit smoothie.',
                ),
                MenuItemCard(
                  name: 'Ramen',
                  price: "7.99",
                  description: 'Traditional Japanese ramen soup.',
                ),
                MenuItemCard(
                  name: 'Fish and Chips',
                  price: "8.99",
                  description: 'Classic fish and chips with tartar sauce.',
                ),
                MenuItemCard(
                  name: 'Curry',
                  price: "6.99",
                  description: 'Spicy curry with rice.',
                ),
                MenuItemCard(
                  name: 'Cheesecake',
                  price: "4.99",
                  description: 'Creamy cheesecake with a graham cracker crust.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<RestaurantsModel?> getRestaurantDataWithId(String restaurantId) async {
    try {
      // Get a reference to the Firestore document using the provided document ID
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Restaurants') // Change 'restaurants' to your collection name
          .doc(restaurantId)
          .get();
      // Check if the document exists
      if (documentSnapshot.exists) {
        // Access data from the document
        //print('Document data: ${documentSnapshot.data()}');
        RestaurantsModel restaurant = RestaurantsModel.fromDocumentSnapshot(documentSnapshot);
        return restaurant;
      } else {
        showToast(message: 'Restaurant profile does not exist, please contact support');
        return null;
      }
    } catch (e) {
      showToast(message: 'Error getting Restaurant profile: $e');
    }
    return null;
  }

}
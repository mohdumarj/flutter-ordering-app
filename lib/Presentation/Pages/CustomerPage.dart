import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';
import 'package:untitled9/Entities/UsersModel.dart';

import 'AccountPage.dart';
import 'AsianFoodPage.dart';
import 'BaitAlMadkohoutPage.dart';
import 'BaithAlShaypage.dart';
import 'BeveragesPage.dart';
import 'Cafe42Page.dart';
import 'CartPage.dart';
import 'FastFoodPage.dart';
import 'FoodTypeCardPage.dart';
import 'NafahatBurgerPage.dart';
import 'RestaurantLabelPage.dart';
import 'SweetsPage.dart';

class CustomerPage extends StatefulWidget {

  final dynamic data;
  CustomerPage({Key? key, required this.data}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    var restaurantsList = _readRestaurantsData();
    //=> Restaurants list contains all registered restaurants in the system.
    // Each restaurant has its Menus as colelction
    // Each Menu has its items list in it as collection
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ' + widget.data.toString().toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for restaurants...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Types of Food and Drinks',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FoodTypeCard(
                      icon: Icons.fastfood,
                      label: 'Fast Food',
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FastFoodPage()),
                        );
                      },
                    ),
                    FoodTypeCard(
                      icon: Icons.local_cafe,
                      label: 'Beverages',
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BeveragesPage()),
                        );
                      },
                    ),
                    FoodTypeCard(
                      icon: Icons.local_dining,
                      label: 'Asian Food',
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AsianFoodPage()),
                        );
                      },
                    ),
                    FoodTypeCard(
                      icon: Icons.cake,
                      label: 'Sweets',
                      color: Colors.purple,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SweetsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Restaurants',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RestaurantLabel(
                    label: 'Nafahat Burger',
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NafahatBurgerPage()),
                      );
                    },
                  ),
                  RestaurantLabel(
                    label: 'Baith AlShay',
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BaithAlShaypage()),
                      );
                    },
                  ),
                  RestaurantLabel(
                    label: 'Bait AlMadkohout',
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BaitAlMadkohoutPage()),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Navigate to home page
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                // Navigate to cart page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {
                // Navigate to account page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
  Future<Stream<List<RestaurantsModel>>> _readRestaurantsData() async {
    try {
      final restaurantCollection = FirebaseFirestore.instance.collection("Restaurants");

      return restaurantCollection.snapshots().map((qureySnapshot)
      => qureySnapshot.docs.map((e)
      => RestaurantsModel.fromSnapshot(e),).toList());
    } catch (e) {
      print('Error fetching data: $e');
    }

  }

}

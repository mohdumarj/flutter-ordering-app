import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:AmmarQiuckServe/Entities/RestaurantsModel.dart';
import 'package:AmmarQiuckServe/Presentation/Pages/Restaurants/RestaurantDetailScreen.dart';

import '../../../../Globals/Common/Toast.dart';
import '../../AccountPage.dart';
import '../../AsianFoodPage.dart';
import '../../BeveragesPage.dart';
import '../../CartPage.dart';
import '../../FastFoodPage.dart';
import '../../FoodTypeCardPage.dart';
import '../../RestaurantLabelPage.dart';
import '../../SweetsPage.dart';

class CustomerPage extends StatefulWidget {

  final dynamic data;
  const CustomerPage({super.key, required this.data});
  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  // Define variables within the state class
  @override
  void initState() {
    super.initState();
    // Initialization tasks can be performed here
 //   listedRestaurants = _readRestaurantsData().toList() as List<RestaurantsModel>;

  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        title: Text('Welcome ${widget.data.toString().toUpperCase()}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Search bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for restaurants...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
           //Food Type
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Types of Food and Drinks',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
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
                          MaterialPageRoute(builder: (context) => const FastFoodPage()),
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
                          MaterialPageRoute(builder: (context) => const BeveragesPage()),
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
                          MaterialPageRoute(builder: (context) => const AsianFoodPage()),
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
                          MaterialPageRoute(builder: (context) => const SweetsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
/*
            //Restaurants label
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Restaurants',
                style: TextStyle(fontSize: 18),
              ),
            ),
            //Restaurants list
            Row(
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
*/
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Restaurants From Data Stream',
                style: TextStyle(fontSize: 18),
              ),
            ),
            //Restaurants list Dynamic
            StreamBuilder<List<RestaurantsModel>>(
              stream: _readRestaurantsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                if (snapshot.data!.isEmpty) {
                  return const Center(child: Text("No Data Yet"));
                }
                final restaurants = snapshot.data;
                Iterable<RestaurantLabel> restaurantLabels = restaurants!.map((restaurant) {
                  return RestaurantLabel(label: restaurant.name!,color: getRandomColor(),onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(restaurant: restaurant)),
                    );
                  },);
                });
                List<Widget> restaurantWidgets = restaurantLabels.toList();
                child: return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: restaurantWidgets, // RestaurantLabel widgets as children
                  ),
                );
              }
            ),
            const SizedBox(height: 10),


          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {
              // RestaurantsModel? restaurant = await getRestaurantDataWithId("20xwFE3GpI6ORDSEabwg") ;
              // print(restaurant!.name);
                // Navigate to home page
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                // Navigate to cart page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {
                // Navigate to account page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
              },
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<RestaurantsModel>> _readRestaurantsData()  {
    try {
      final restaurantCollection = FirebaseFirestore.instance.collection("Restaurants");

      var result = restaurantCollection.snapshots().map((qureySnapshot)
      => qureySnapshot.docs.map((e)
      => RestaurantsModel.fromDocumentSnapshot(e),).toList());

      return result;
    } catch (e) {
      print('Error fetching data: $e');
      return const Stream<List<RestaurantsModel>>.empty();
    }

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

  Color getRandomColor() {
    const List<Color> colorsList = Colors.primaries; // Get all primary colors
    final Random random = Random();
    final int randomIndex = random.nextInt(colorsList.length);
    return colorsList[randomIndex];
  }
}

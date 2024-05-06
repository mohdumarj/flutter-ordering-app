import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';
import 'package:untitled9/Presentation/Pages/Restaurants/RestaurantDetailScreen.dart';
import '../../AccountPage.dart';
import '../../AsianFoodPage.dart';
import '../../BaitAlMadkohoutPage.dart';
import '../../BaithAlShaypage.dart';
import '../../BeveragesPage.dart';
import '../../Cafe42Page.dart';
import '../../CartPage.dart';
import '../../FastFoodPage.dart';
import '../../FoodTypeCardPage.dart';
import '../../NafahatBurgerPage.dart';
import '../../RestaurantLabelPage.dart';
import '../../SweetsPage.dart';

class CustomerPage extends StatefulWidget {
  final dynamic data;
  CustomerPage({Key? key, required this.data}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome ' + widget.data.toString().toUpperCase())),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FastFoodPage()));
                      },
                    ),
                    FoodTypeCard(
                      icon: Icons.local_cafe,
                      label: 'Beverages',
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BeveragesPage()));
                      },
                    ),
                    FoodTypeCard(
                      icon: Icons.local_dining,
                      label: 'Asian Food',
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AsianFoodPage()));
                      },
                    ),
                    FoodTypeCard(
                      icon: Icons.cake,
                      label: 'Sweets',
                      color: Colors.purple,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SweetsPage()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Restaurants From Data Stream', style: TextStyle(fontSize: 18)),
            ),
            StreamBuilder<List<RestaurantsModel>>(
              stream: _readRestaurantsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.data!.isEmpty) {
                  return Center(child: Text("No Data Yet"));
                }
                final restaurants = snapshot.data;
                List<RestaurantLabel> restaurantLabels = restaurants!.map((restaurant) {
                  return RestaurantLabel(
                    label: restaurant.name!,
                    color: getRandomColor(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RestaurantDetailScreen(restaurant: restaurant)),
                      );
                    },
                  );
                }).toList();

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: restaurantLabels,
                  ),
                );
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
              },
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<RestaurantsModel>> _readRestaurantsData() {
    try {
      final restaurantCollection = FirebaseFirestore.instance.collection("Restaurants");
      return restaurantCollection.snapshots().map(
            (qureySnapshot) => qureySnapshot.docs
            .map((e) => RestaurantsModel.fromDocumentSnapshot(e))
            .toList(),
      );
    } catch (e) {
      return Stream<List<RestaurantsModel>>.empty();
    }
  }

  Future<RestaurantsModel?> getRestaurantDataWithId(String restaurantId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('Restaurants').doc(restaurantId).get();
      if (documentSnapshot.exists) {
        return RestaurantsModel.fromDocumentSnapshot(documentSnapshot);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Color getRandomColor() {
    final List<Color> colorsList = Colors.primaries;
    final Random random = Random();
    final int randomIndex = random.nextInt(colorsList.length);
    return colorsList[randomIndex];
  }
}

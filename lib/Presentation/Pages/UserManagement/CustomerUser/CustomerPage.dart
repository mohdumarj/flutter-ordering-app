import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';
import 'package:untitled9/Entities/UsersModel.dart';

import '../../../../Globals/Common/Toast.dart';
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
  Widget build(BuildContext context) {
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
            SizedBox(height: 10),
      /*      //testCode
            StreamBuilder<List<RestaurantsModel>>(
                stream: _readRestaurantsData() ,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  } if(snapshot.data!.isEmpty){
                    return Center(child:Text("No Data Yet"));
                  }
                  final restaurants = snapshot.data;
                  return Padding(padding: EdgeInsets.all(8),
                    child: Column(
                        children: restaurants!.map((restaurant) {
                          return ListTile(
                            leading: GestureDetector(
                              onTap: (){
                                //_deleteData(user.id!);
                              },
                              child: Icon(Icons.delete),
                            ),
                            trailing: GestureDetector(
                              onTap: (){
                                // _updateData(
                                //     UserModel(
                                //       id: user.id,
                                //       username: "John Wick",
                                //       adress: "Pakistan",)
                                // );
                              },
                              child: Icon(Icons.update),
                            ),
                            title: Text(restaurant.name!),
                            subtitle: Text(restaurant.address!),
                          );
                        }).toList()
                    ),);
                }
            ),
            //testCode
            */

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {
               RestaurantsModel? restaurant = await getRestaurantDataWithId("20xwFE3GpI6ORDSEabwg") ;
               print(restaurant!.name);
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
  /*
  Stream<List<RestaurantsModel>> _readRestaurantsData()  {
    try {
      final restaurantCollection = FirebaseFirestore.instance.collection("Restaurants");

      var result = restaurantCollection.snapshots().map((qureySnapshot)
      => qureySnapshot.docs.map((e)
      => RestaurantsModel.fromSnapshot(e),).toList());

      return result;
    } catch (e) {
      print('Error fetching data: $e');
      return Stream<List<RestaurantsModel>>.empty();
    }

  }
*/
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
  }

}

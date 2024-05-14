import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

import '../../../Globals/Common/Globals.dart';
import '../RestaurantLabelPage.dart';
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

      //
      // StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection('Restaurants').snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     }
      //     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      //       return Center(child: Text('No data available'));
      //     }
      //     List<RestaurantsModel> restaurants = snapshot.data!.docs.map((doc) {
      //       return RestaurantsModel.fromMap(doc.data() as Map<String, dynamic>);
      //     }).toList();
      //     return ListView.builder(
      //       itemCount: restaurants.length,
      //       itemBuilder: (context, index) {
      //         RestaurantsModel restaurant = restaurants[index];
      //         return ListTile(
      //           title: Text(restaurant.name?? "Selected Restaurant"),
      //           subtitle: Text(restaurant.address?? "Selected Restaurant Address"),
      //           onTap: () {
      //             // Navigate to a detail screen for the restaurant
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => RestaurantDetailScreen(restaurant: restaurant),
      //               ),
      //             );
      //           },
      //         );
      //       },
      //     );
      //   },
      // ),
    );
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:AmmarQiuckServe/Entities/RestaurantsModel.dart';

import 'RestaurantDetailScreen.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Restaurants').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data available'));
          }
          List<RestaurantsModel> restaurants = snapshot.data!.docs.map((doc) {
            return RestaurantsModel .fromMap(doc.data() as Map<String, dynamic>);
          }).toList();
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              RestaurantsModel restaurant = restaurants[index];
              return ListTile(
                title: Text(restaurant.name?? "Selected Restaurant"),
                subtitle: Text(restaurant.address?? "Selected Restaurant Address"),
                onTap: () {
                  // Navigate to a detail screen for the restaurant
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantDetailScreen(restaurant: restaurant),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

}

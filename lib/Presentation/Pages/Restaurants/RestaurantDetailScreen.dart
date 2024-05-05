import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantMenuModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final RestaurantsModel restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name ?? "Selected Restaurant"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Address: ${restaurant.address}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Email: ${restaurant.email}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Phone Number: ${restaurant.phoneNumber}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Website: ${restaurant.website}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: restaurant.menusList.length,
              itemBuilder: (context, index) {
                RestaurantMenuModel menu = restaurant.menusList[index];
                return ExpansionTile(
                  title: Text(menu.menuName ?? "Selected Menu"),
                  children: menu.menuItems!.map((item) {
                    return ListTile(
                      title: Text(item.name ?? "Selected Item name"),
                      subtitle: Text(item.description ?? "Selected Item Description"),
                      trailing: Text(item.price ?? "Check With Staff",
                    ));
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

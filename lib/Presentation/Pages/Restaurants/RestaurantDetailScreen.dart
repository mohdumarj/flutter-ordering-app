import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/RestaurantMenuModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

import '../MenuItemCard.dart';

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
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Address: ${widget.restaurant.address}',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Email: ${widget.restaurant.email}',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Phone Number: ${widget.restaurant.phoneNumber}',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Website: ${widget.restaurant.website}',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
          //
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.restaurant.menusList.length,
              itemBuilder: (context, index) {
                RestaurantMenuModel menu = widget.restaurant.menusList[index];
                return ExpansionTile(
                  title: Text(menu.menuName ?? "Selected Menu"),
                  children: menu.menuItems!.map((item) {
                    return MenuItemCard(
                      name: item.name ?? "Selected Item name",
                      price: item.price ?? "Selected Item Description",
                      description: item.price ?? "Check With Staff",
                    );
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

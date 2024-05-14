import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/OrderModel.dart';

import '../../../Entities/MenuItemModel.dart';
import '../../../Entities/UserCartItemModel.dart';

class KitchenDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          List<OrderModel> orders = snapshot.data!.docs.map((doc) {
            List<UserCartItemModel> selectedMenuItems =
                (doc['selectedMenuItems'] as List<dynamic>).map((cartItem) {
              return UserCartItemModel(
                resturantId: cartItem['restaurantId'],
                menuItem: MenuItemModel(
                  id: cartItem['menuItem']['id'],
                  name: cartItem['menuItem']['name'],
                  description: cartItem['menuItem']['description'],
                  price: cartItem['menuItem']['price'],
                  picture: cartItem['menuItem']['picture'],
                  category: cartItem['menuItem']['category'],
                  calories: cartItem['menuItem']['calories'],
                ),
                quantity: cartItem['quantity'].toDouble(),
              );
            }).toList();
            return OrderModel(
              userId: doc['userId'],
              orderPlacementTime: doc['orderPlacementTime'],
              orderCompletionTime: doc['orderCompletionTime'],
              orderStatus: doc['orderStatus'],
              selectedMenuItems: selectedMenuItems,
            );
          }).toList();

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              OrderModel order = orders[index];
              return FutureBuilder<String?>(
                future: getUsername(order.userId!),
                builder: (context, usernameSnapshot) {
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                              'Order for ${usernameSnapshot.data ?? "Customer"}'),
                          subtitle: Text('Status: ${order.orderStatus}'),
                          trailing: IconButton(
                            icon: Icon(Icons.print),
                            onPressed: () {
                              // Handle print button pressed
                              print(
                                  'Print button pressed for order ${order.userId}');
                            },
                          ),
                        ),
                        Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: order.selectedMenuItems!.length,
                          itemBuilder: (context, index) {
                            UserCartItemModel cartItem =
                                order.selectedMenuItems![index];
                            return ListTile(
                              title: Text(cartItem.menuItem!.name!),
                              subtitle: Text('Quantity: ${cartItem.quantity}'),
                              trailing:
                                  Text('Price: ${cartItem.menuItem!.price}'),
                            );
                          },
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                              'Order Placement Time: ${order.orderPlacementTime}'),
                        ),
                        ListTile(
                          title: Text(
                              'Order Completion Time: ${order.orderCompletionTime}'),
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle change order status button pressed
                                print(
                                    'Change order status button pressed for order ${order.userId}');
                              },
                              child: Text('Change Order Status'),
                            ),
                          ],
                        ),
                      ],
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

  Future<String?> getUsername(String userId) async {
    // Reference to the "users" collection
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');

    try {
      // Query the "users" collection for the document with the given user ID
      DocumentSnapshot userSnapshot = await usersCollection.doc(userId).get();

      // Check if the document exists and contains the "username" field
      if (userSnapshot.exists) {
        // Retrieve the username from the document data
        String? username = userSnapshot['username'];
        return username;
      } else {
        // User document does not exist
        return null;
      }
    } catch (e) {
      // Error occurred while querying the database
      print('Error retrieving username: $e');
      return null;
    }
  }
}

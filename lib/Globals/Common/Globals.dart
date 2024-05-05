import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled9/Entities/RestaurantMenuModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

import '../../Entities/MenuItemModel.dart';
import 'Toast.dart';

class Globals {

  final firestoreGlobalInstance = FirebaseFirestore.instance;

  Future<void> AppInit() async {
    final restaurantsCollection = FirebaseFirestore.instance.collection(
        'Restaurants');
    final RestaurantsModel restaurant1 = RestaurantsModel(
        id: "1",
        name: "Restaurant 1",
        address: "Abu Dhabi",
        email: "r1@gmail.com",
        website: "www.r1auh.ae",
        phoneNumber: "02-123456",
        menusList: [
          RestaurantMenuModel(
              id: "1",
              menuName: "All Day Menu",
              startDate: DateTime.now().toString(),
              endDate: DateTime.now().add(Duration(days: 365)).toString(),
              menuItems: [
                MenuItemModel(
                    id: "1",
                    name: "Cheez Fatair",
                    description: "Cheez Fatair: special Fatair made with cheeze",
                    price: "20 AED",
                    picture: "",
                    calories: "200",
                    category: "Arabic Food"
                ),
                MenuItemModel(
                    id: "2",
                    name: "Za'tar Fatair",
                    description: "Za'tar Fatair: special Fatair made with Za'tar",
                    price: "20 AED",
                    picture: "",
                    calories: "200",
                    category: "Arabic Food"
                )
              ])
        ]);
    final RestaurantsModel restaurant2 = RestaurantsModel(
        id: "1",
        name: "Restaurant 2",
        address: "Abu Dhabi",
        email: "r2@gmail.com",
        website: "www.r2auh.ae",
        phoneNumber: "02-123456",
        menusList: [
          RestaurantMenuModel(
              id: "2",
              menuName: "All Day Menu",
              startDate: DateTime.now().toString(),
              endDate: DateTime.now().add(Duration(days: 365)).toString(),
              menuItems: [
                MenuItemModel(
                    id: "4",
                    name: "Chai",
                    description: "Fresh Milk Chai",
                    price: "2 AED",
                    picture: "",
                    calories: "200",
                    category: "Beverages"
                ),
                MenuItemModel(
                    id: "5",
                    name: "Cofee",
                    description: "Cofee with Milk",
                    price: "4 AED",
                    picture: "",
                    calories: "200",
                    category: "Beverages"
                )
              ])
        ]);

    QuerySnapshot querySnapshot = await restaurantsCollection.get();
    if (querySnapshot.docs.isEmpty) {
      try {
        await restaurantsCollection.add(restaurant1.toJson());
        await restaurantsCollection.add(restaurant2.toJson());
      } catch (e) {
        showToast(message:"Error adding user: $e");
        print("Error adding user: $e");
      }
    }
  }
}


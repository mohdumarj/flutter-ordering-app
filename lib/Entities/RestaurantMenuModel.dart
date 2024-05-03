import 'package:cloud_firestore/cloud_firestore.dart';

import 'MenuItemModel.dart';

class RestaurantMenuModel{
  final String? id;
  // final String? restaurantId ;
  final String? menuName ;
  final String? startDate ;
  final String? endDate ;
  final List<MenuItemModel>? menuItems;

  static RestaurantMenuModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return RestaurantMenuModel(
        id: snapshot['id'],
        // restaurantId: snapshot['restaurantId'],
        menuName: snapshot['menuName'],
        startDate: snapshot['startDate'],
        endDate: snapshot['endDate']

    );
  }


  RestaurantMenuModel( {this.id, /*this.restaurantId,*/ this.menuName, this.startDate,this.endDate,this.menuItems});
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      // "restaurantId": restaurantId,
      "menuName": menuName,
      "startDate": startDate,
      "endDate": endDate,

    };
  }
}
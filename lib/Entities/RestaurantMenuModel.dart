import 'package:cloud_firestore/cloud_firestore.dart';

import 'MenuItemModel.dart';

class RestaurantMenuModel{
  final String? id;
   final String? restaurantId ;
  final String? menuName ;
  final String? startDate ;
  final String? endDate ;
  final List<MenuItemModel>? menuItems;

  RestaurantMenuModel( {this.id, this.restaurantId, this.menuName, this.startDate,this.endDate,this.menuItems});
  static RestaurantMenuModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return RestaurantMenuModel(
        id: snapshot['id'],
        restaurantId: snapshot['restaurantId'],
        menuName: snapshot['menuName'],
        startDate: snapshot['startDate'],
        endDate: snapshot['endDate'],
      menuItems: snapshot['menuItems']

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
       "restaurantId": restaurantId,
      "menuName": menuName,
      "startDate": startDate,
      "endDate": endDate,
      "menuItems":menuItems?.map((menuItem) => menuItem.toJson()).toList(),


  };
  }
  factory RestaurantMenuModel.fromMap(Map<String, dynamic> map) {
    List<MenuItemModel> items = [];
    if (map['menuItems'] != null) {
      for (var item in map['menuItems']) {
        items.add(MenuItemModel.fromMap(item));
      }
    }
    return RestaurantMenuModel(
      id: map['id'],
      menuName: map['menuName'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      menuItems: items,
    );
  }
}
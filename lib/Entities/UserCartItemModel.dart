

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled9/Entities/MenuItemModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

class UserCartItemModel {
  final String? resturantId;
  final MenuItemModel? menuItem;
  double quantity;


  UserCartItemModel({
   required this.resturantId,
   required this.menuItem,
    this.quantity = 0
  });


  factory UserCartItemModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserCartItemModel(

      resturantId:snapshot['resturantId'] ?? '',
      menuItem:snapshot['menuItem'] ,
      quantity:snapshot['quantity'] ,

    );
  }

  static UserCartItemModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return UserCartItemModel(
      resturantId:snapshot['resturantId'] ?? '',
      menuItem:snapshot['menuItem'] ,
      quantity:snapshot['quantity'] ,
    );
  }
  Map<String, dynamic> toJson() {
    return {

      "resturantId":resturantId,
      "menuItem":menuItem?.toJson(),
      "quantity" : quantity
    };
  }

  factory UserCartItemModel.fromMap(Map<String, dynamic> map) {
    return UserCartItemModel(
      resturantId:map['resturantId'] ?? '',
      menuItem:map['menuItem'],
      quantity:map['quantity'] ,

    );
  }
}
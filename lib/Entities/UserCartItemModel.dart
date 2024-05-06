

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled9/Entities/MenuItemModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

class UserCartItemModel {
  final String? resturantId;
  final MenuItemModel? menuItem;


  UserCartItemModel({
   required this.resturantId,
   required this.menuItem,
  });


  factory UserCartItemModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserCartItemModel(

      resturantId:snapshot['resturantId'] ?? '',
      menuItem:snapshot['menuItem'] ,

    );
  }

  static UserCartItemModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return UserCartItemModel(
      resturantId:snapshot['resturantId'] ?? '',
      menuItem:snapshot['menuItem'] ,

    );
  }
  Map<String, dynamic> toJson() {
    return {

      "resturantId":resturantId,
      "menuItem":menuItem,
    };
  }
}
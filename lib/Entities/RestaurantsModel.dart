import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled9/Entities/MenuItemModel.dart';

import 'RestaurantMenuModel.dart';

class RestaurantsModel{
  final String? id;
  final String? name ;
  final String? address ;
  final String? email ;
  final String? website ;
  final String? phoneNumber ;
  final List<RestaurantMenuModel> menusList;

  RestaurantsModel({this.id, required this.name, this.address, this.email,this.website,required  this.phoneNumber,required this.menusList});


  static RestaurantsModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return RestaurantsModel(
        id: snapshot['id'],
        name: snapshot['name'],
        address: snapshot['address'],
        email: snapshot['email'],
        website: snapshot['website'],
        phoneNumber: snapshot['phoneNumber'],
        menusList : snapshot['menueList']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "email": email,
      "website": website,
      "phoneNumber": phoneNumber,
      "menusList" : menusList.map((menu) => menu.toJson()).toList(),

    };
  }
  factory RestaurantsModel.fromMap(Map<String, dynamic> map) {
    List<RestaurantMenuModel> menus = [];
    if (map['menusList'] != null) {
      for (var menu in map['menusList']) {
        menus.add(RestaurantMenuModel.fromMap(menu));
      }
    }
    return RestaurantsModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      website: map['website'],
      menusList: menus,
    );
  }
  factory RestaurantsModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {

    var menusFromSnapshot = snapshot['menusList'];
    List<RestaurantMenuModel> menus = [];
    if (menus != null) {
      for (var menu in menusFromSnapshot) {
        menus.add(RestaurantMenuModel.fromMap(menu));
      }
    }

    return RestaurantsModel(
        id: snapshot['id'] ?? '',
        name: snapshot['name']?? '',
        address: snapshot['address']?? '',
        email: snapshot['email']?? '',
        website: snapshot['website']?? '',
        phoneNumber: snapshot['phoneNumber']?? '',
        menusList :  menus,

    );
  }
}
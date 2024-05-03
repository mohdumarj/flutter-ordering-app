import 'package:cloud_firestore/cloud_firestore.dart';

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
      "Id": id,
      "Name": name,
      "Address": address,
      "Email": email,
      "Website": website,
      "PhoneNumber": phoneNumber,
      "menusList" : menusList,
    };
  }
}
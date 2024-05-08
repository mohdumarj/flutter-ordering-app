import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

class UsersModel{
  final String? id;
  final String? username ;
  final String? userType ;
  final String? email ;
  final String? phoneNumber ;
  final RestaurantsModel? restaurant ;

  UsersModel({this.id, this.username, this.userType, this.email, this.phoneNumber, this.restaurant});

  factory UsersModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UsersModel(

        id: snapshot['id']?? '',
        username: snapshot['username']?? '',
        userType: snapshot['userType']?? '',
        email: snapshot['email']?? '',
        phoneNumber: snapshot['phoneNumber']?? '',
        restaurant : snapshot['restaurant'],
    );
  }

  static UsersModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return UsersModel(
        id: snapshot['id'],
        username: snapshot['username'],
        userType: snapshot['userType'],
        email: snapshot['email'],
        phoneNumber: snapshot['phoneNumber'],
        restaurant : snapshot['restaurant']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "userType": userType,
      "email": email,
      "phoneNumber": phoneNumber,
      "restaurant" : restaurant?.toJson(),
    };
  }
}
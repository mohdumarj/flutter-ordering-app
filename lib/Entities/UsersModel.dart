import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel{
  final String? Id;
  final String? Username ;
  final String? UserType ;
  final String? Email ;
  final String? PhoneNumber ;

  UsersModel({this.Id, this.Username, this.UserType, this.Email, this.PhoneNumber});


  static UsersModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return UsersModel(
        Id: snapshot['Id'],
        Username: snapshot['Username'],
        UserType: snapshot['UserType'],
        Email: snapshot['Email'],
        PhoneNumber: snapshot['PhoneNumber']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "Id": Id,
      "Username": Username,
      "UserType": UserType,
      "Email": Email,
      "PhoneNumber": PhoneNumber,
    };
  }
}
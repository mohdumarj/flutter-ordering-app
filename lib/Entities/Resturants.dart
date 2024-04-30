import 'package:cloud_firestore/cloud_firestore.dart';

class ResturantsModel{
  final String? Id;
  final String? Name ;
  final String? Address ;
  final String? Email ;
  final String? Website ;
  final String? PhoneNumber ;

  ResturantsModel({this.Id, this.Name, this.Address, this.Email,this.Website, this.PhoneNumber});


  static ResturantsModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return ResturantsModel(
        Id: snapshot['Id'],
        Name: snapshot['Name'],
        Address: snapshot['Address'],
        Email: snapshot['Email'],
        Website: snapshot['Website'],
        PhoneNumber: snapshot['PhoneNumber']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "Id": Id,
      "Name": Name,
      "Address": Address,
      "Email": Email,
      "Website": Website,
      "PhoneNumber": PhoneNumber,
    };
  }
}
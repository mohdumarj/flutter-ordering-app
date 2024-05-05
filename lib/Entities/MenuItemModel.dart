import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemModel{
  final String? id;
  final String? name ;
  final String? description ;
  final String? price ;
  final String? picture ;
  final String? calories ;

  
  MenuItemModel({this.id, this.name, this.description, this.price,this.picture, this.calories});


  static MenuItemModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return MenuItemModel(
        id: snapshot['id'],
        name: snapshot['name'],
        description: snapshot['description'],
        price: snapshot['price'],
        picture: snapshot['picture'],
        calories: snapshot['calories']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "picture": picture,
      "calories": calories,
    };
  }
  factory MenuItemModel.fromMap(Map<String, dynamic> map) {
    return MenuItemModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      calories: map['calories'],
      picture: map['picture'],
    );
  }

  factory MenuItemModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return MenuItemModel(
      id: snapshot['id'] ?? '',
      name: snapshot['name'] ?? '',
      description: snapshot['description']?? '',
      price: snapshot['price']?? '',
      calories: snapshot['calories']?? '',
      picture: snapshot['picture']?? '',
    );
  }
}
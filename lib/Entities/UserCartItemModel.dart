

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled9/Entities/MenuItemModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

class UserCartItemModel {
  final String? resturantId;
  final List<MenuItemModel>? selectedMenuItems;


  UserCartItemModel({
    this.resturantId,
    this.selectedMenuItems,
  });
}
//   factory UserCartModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
//     return UserCartModel(
//
//       resturantId:snapshot['resturantId'] ?? '',
//       selectedMenuItems:snapshot['selectedMenuItems'] ,
//
//     );
//   }
//
//   static UserCartModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
//     return UserCartModel(
//       resturantId:snapshot['resturantId'] ?? '',
//       selectedMenuItems:snapshot['selectedMenuItems'] ,
//
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       "id":id,
//       "userId":userId,
//       "resturantId":resturantId,
//       "selectedMenuItems":selectedMenuItems,
//     };
//   }
// }
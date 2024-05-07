import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled9/Entities/MenuItemModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';
import 'package:untitled9/Entities/ShoppingCart.dart';
import 'package:untitled9/Entities/UserCartItemModel.dart';

class OrderModel{

   String? userId ;
   String? orderPlacementTime ;
   String? orderCompletionTime ;
   String? orderStatus ;
   List<UserCartItemModel>? cartItemsList ;


  OrderModel(
      {

        this.userId,
        this.orderPlacementTime,
        this.orderCompletionTime,
        this.orderStatus,
        this.cartItemsList,
      });
  OrderModel PrepareOrder(ShoppingCart cart){

    this.userId = ShoppingCart().getUserInformation().id;
    this.orderPlacementTime = DateTime.now().toString();
    this.orderCompletionTime = "";
    this.orderStatus = "Placed";
    this.cartItemsList = ShoppingCart().getItems();
    return this;
  }

  factory OrderModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(


      userId:snapshot['userId'] ?? '',
      orderPlacementTime:snapshot['orderPlacementTime'] ?? '',
      orderCompletionTime:snapshot['orderCompletionTime'] ?? '',
      orderStatus:snapshot['orderStatus'] ?? '',
      cartItemsList:snapshot['selectedMenuItems'] ,

    );
  }

  static OrderModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return OrderModel(

      userId:snapshot['userId'] ?? '',
      orderPlacementTime:snapshot['orderPlacementTime'] ?? '',
      orderCompletionTime:snapshot['orderCompletionTime'] ?? '',
      orderStatus:snapshot['orderStatus'] ?? '',
      cartItemsList:snapshot['selectedMenuItems'] ,

    );
  }
  Map<String, dynamic> toJson() {
    return {

      "userId":userId,
      "orderPlacementTime":orderPlacementTime,
      "orderCompletionTime":orderCompletionTime,
      "orderStatus":orderStatus,
      "selectedMenuItems":cartItemsList?.map((cartItem) => cartItem.toJson()).toList(),
    };
  }
}
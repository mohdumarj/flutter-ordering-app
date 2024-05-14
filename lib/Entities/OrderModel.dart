import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled9/Entities/ShoppingCart.dart';
import 'package:untitled9/Entities/UserCartItemModel.dart';

class OrderModel {
  String? docId;
  String? userId;
  String? orderPlacementTime;
  String? orderCompletionTime;
  String? orderStatus;
  List<UserCartItemModel>? selectedMenuItems;

  OrderModel({
    this.docId,
    this.userId,
    this.orderPlacementTime,
    this.orderCompletionTime,
    this.orderStatus,
    this.selectedMenuItems,
  });
  OrderModel PrepareOrder(ShoppingCart cart) {
    this.docId = "";
    this.userId = ShoppingCart().getUserInformation().id;
    this.orderPlacementTime = DateTime.now().toString();
    this.orderCompletionTime = "";
    this.orderStatus = "Placed";
    this.selectedMenuItems = ShoppingCart().getItems();
    return this;
  }

  factory OrderModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(
      docId: snapshot['docId'] ?? '',
      userId: snapshot['userId'] ?? '',
      orderPlacementTime: snapshot['orderPlacementTime'] ?? '',
      orderCompletionTime: snapshot['orderCompletionTime'] ?? '',
      orderStatus: snapshot['orderStatus'] ?? '',
      selectedMenuItems: snapshot['selectedMenuItems'],
    );
  }

  static OrderModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return OrderModel(
      docId: snapshot['docId'] ?? '',
      userId: snapshot['userId'] ?? '',
      orderPlacementTime: snapshot['orderPlacementTime'] ?? '',
      orderCompletionTime: snapshot['orderCompletionTime'] ?? '',
      orderStatus: snapshot['orderStatus'] ?? '',
      selectedMenuItems: snapshot['selectedMenuItems'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "docId": docId,
      "userId": userId,
      "orderPlacementTime": orderPlacementTime,
      "orderCompletionTime": orderCompletionTime,
      "orderStatus": orderStatus,
      "selectedMenuItems":
          selectedMenuItems?.map((cartItem) => cartItem.toJson()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    List<UserCartItemModel> menuItems = [];
    if (map['selectedMenuItems'] != null) {
      for (var item in map['selectedMenuItems']) {
        menuItems.add(UserCartItemModel.fromMap(item));
      }
    }
    return OrderModel(
      docId: map['docId'] ?? '',
      userId: map['userId'] ?? '',
      orderPlacementTime: map['orderPlacementTime'] ?? '',
      orderCompletionTime: map['orderCompletionTime'] ?? '',
      orderStatus: map['orderStatus'] ?? '',
      selectedMenuItems: menuItems,
    );
  }
}

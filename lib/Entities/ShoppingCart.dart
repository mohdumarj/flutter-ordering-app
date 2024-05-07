import 'package:flutter/material.dart';
import 'package:untitled9/Entities/UserCartItemModel.dart';
import 'package:untitled9/Entities/UsersModel.dart';

class ShoppingCart {


  // List to store items in the shopping cart

  UsersModel _userInformation = UsersModel();
  List<UserCartItemModel> _items = [];



  // Private constructor
  ShoppingCart._();
  static final ShoppingCart _instance = ShoppingCart._internal();
  // Singleton instance
  //static final ShoppingCart _instance = ShoppingCart._();

  // Factory method to access the singleton instance
  factory ShoppingCart() {
    return _instance;
  }
  ShoppingCart._internal();
  // Method to add item to the cart
  void addItem(UserCartItemModel item) {
    if (_items.contains(item)) {
      // Increment item quantity
      int index = _items.indexWhere((element) => element == item);
      _items[index].quantity += 1;
    } else {
      item.quantity = 1;
      _items.add(item);
    }

  }

  // Method to remove item from the cart
  void removeItem(UserCartItemModel item) {
    _items.remove(item);
  }

  // Method to get all items in the cart
  List<UserCartItemModel> getItems() {
    return List<UserCartItemModel>.from(_items);
  }

  // Method to clear the cart
  void clearCart() {
    _items.clear();
  }
  void setUserInformation( UsersModel user) {
    this._userInformation = user;
  }

  UsersModel getUserInformation() {
    return this._userInformation ;
  }
  int getTotalItemCount(){
    return this._items.length;
  }
  double getItemsTotalPrice(){
    double total = 0.0;
    double itemPrice = 0.0;
    for (var item in _items) {

      try {
        var price = item.menuItem?.price!.split(" ");
        itemPrice = double.parse( price?.first ?? "0.0");
        // Use floatValue here
      } catch (e) {
        itemPrice = 0.0;
      }
      total += itemPrice * item.quantity * 1.05;// adding 5% tax
    }
    return total;
  }

}


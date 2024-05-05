import 'package:flutter/material.dart';
import 'package:untitled9/Entities/UserCartItemModel.dart';
import 'package:untitled9/Entities/UsersModel.dart';

class ShoppingCart {

  // List to store items in the shopping cart
  UsersModel _userInformation = UsersModel();
  List<UserCartItemModel> _items = [];


  // Private constructor
  ShoppingCart._();

  // Singleton instance
  static final ShoppingCart _instance = ShoppingCart._();

  // Factory method to access the singleton instance
  factory ShoppingCart() {
    return _instance;
  }

  // Method to add item to the cart
  void addItem(UserCartItemModel item) {
    _items.add(item);
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
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/ShoppingCart.dart';

import '../../Entities/UserCartItemModel.dart';

class MenuItemCard extends StatelessWidget {
   /*final*/ String? name;
   /*final*/ String? price;
   /*final*/ String? description;
   UserCartItemModel? userCartItemModel;

  MenuItemCard( {
    /*required */this.name,
    /*required */this.price,
    /*required */this.description,
    this.userCartItemModel,
  });
  MenuItemCard initMenuItemCard(UserCartItemModel userCartItemModel) {
    this.name = userCartItemModel.menuItem?.name;
    this.price = userCartItemModel.menuItem?.price;
    this.description = userCartItemModel.menuItem?.description;
    this.userCartItemModel = userCartItemModel;

    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 4,
      child: ListTile(
        title: Text(name!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description!),
            Text(
                price!,//'\OMR${price.toStringAsFixed(3)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
             ShoppingCart().addItem(userCartItemModel!);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Added ${userCartItemModel?.menuItem?.name} to cart')),
            );
          },
          child: Text('Add to Cart'),
        ),
      ),
    );
  }
}
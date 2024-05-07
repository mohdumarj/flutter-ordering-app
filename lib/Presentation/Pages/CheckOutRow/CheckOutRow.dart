import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Entities/UserCartItemModel.dart';


class CheckOutRow extends StatelessWidget {
  /*final*/ String? name;
  /*final*/ String? price;
  /*final*/ String? description;
  UserCartItemModel? userCartItemModel;

  CheckOutRow({
    /*required */this.name,
    /*required */this.price,
    /*required */this.description,
    this.userCartItemModel,
  });
  CheckOutRow initMenuItemCard(UserCartItemModel userCartItemModel) {
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
      ),
    );
  }
}
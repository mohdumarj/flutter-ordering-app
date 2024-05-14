import 'package:flutter/material.dart';

import '../../../Entities/ShoppingCart.dart';
import '../../../Entities/UserCartItemModel.dart';

class CheckOutRow extends StatefulWidget {
  final UserCartItemModel item;
  final Function(UserCartItemModel) onDelete;
  final Function() onIncreaseItem;
  final Function() onDecreaseItem;

  CheckOutRow(
      {required this.item,
      required this.onDelete,
      required this.onIncreaseItem,
      required this.onDecreaseItem});

  @override
  _CheckOutRowState createState() => _CheckOutRowState();
}

class _CheckOutRowState extends State<CheckOutRow> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.item.quantity.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 4,
      child: ListTile(
        title: Text(widget.item.menuItem!.name!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.item.menuItem!.description!),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) {
                        _quantity--;
                        ShoppingCart().removeItem(widget.item);
                      }
                      widget.onDecreaseItem();
                    });
                  },
                ),
                Text('$_quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                      ShoppingCart().addItem(widget.item);
                      widget.onIncreaseItem();
                    });
                  },
                ),
              ],
            ),
            Text(
              'Price: ${widget.item.menuItem!.price}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            widget.onDelete(widget.item);
          },
        ),
      ),
    );
  }
}

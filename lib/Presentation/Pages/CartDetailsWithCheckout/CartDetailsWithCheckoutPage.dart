import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Entities/OrderModel.dart';
import '../../../Entities/ShoppingCart.dart';
import '../../../Entities/UserCartItemModel.dart';
import '../../../Globals/Common/Toast.dart';
import '../CheckOutRow/CheckOutRow.dart';
import '../UserManagement/CustomerUser/CustomerPage.dart';

class CartDetailsWithCheckoutPage extends StatefulWidget {
  @override
  State<CartDetailsWithCheckoutPage> createState() =>
      _CartDetailsWithCheckoutPageState();
}

class _CartDetailsWithCheckoutPageState
    extends State<CartDetailsWithCheckoutPage> {
  List<UserCartItemModel> items = [];
  double totalPayable = 0;

  @override
  void initState() {
    super.initState();
    // Initialize cart items and total payable
    updateCartDetails();
  }

  void updateCartDetails() {
    // Update cart items and total payable
    setState(() {
      var cart = ShoppingCart();
      items = cart.getItems();
      totalPayable = cart.getItemsTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cart = ShoppingCart();
    var totalPayable =
        cart.getItemsTotalPrice(); // Access the singleton instance
    this.items = ShoppingCart().getItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Order'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4, // Adjust the elevation for a shadow effect
            color: Colors.orangeAccent, // Background color
            margin: EdgeInsets.all(16), // Adjust the margin as needed
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Customer Name: ${cart.getUserInformation().username}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Email: ${cart.getUserInformation().email}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Cart Items
          Expanded(
            child: ListView.builder(
              itemCount: cart.getTotalItemCount(), //.items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return CheckOutRow(
                  item: item,
                  onDelete: (deletedItem) {
                    ShoppingCart().removeItem(deletedItem);
                    updateCartDetails();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${deletedItem.menuItem!.name} removed from cart'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            cart.addItem(deletedItem);
                            updateCartDetails();
                          },
                        ),
                      ),
                    );
                  },
                  onIncreaseItem: () {
                    updateCartDetails();
                  },
                  onDecreaseItem: () {
                    updateCartDetails();
                  },
                );
              },
            ),
          ),
          // Total Price
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \OMR${totalPayable.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Checkout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //call function to place convert data into Order and push it to firebase
                  placeOrder();
                  ShoppingCart().clearCart();

                  Navigator.pushReplacement(
                    context,
                    //MaterialPageRoute(builder: (context) => RestaurantScreen()),//CustomerPage(data: userProfile?.username ?? 'Customer')),
                    MaterialPageRoute(
                        builder: (context) =>
                            CustomerPage()), //data: userProfile?.username ?? 'Customer')),
                  );
                },
                child: Text('Finalize and Place Your Order'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> placeOrder() async {
    try {
      CollectionReference firebaseOrdersCollection =
          FirebaseFirestore.instance.collection('Orders');
      var order = OrderModel().PrepareOrder(ShoppingCart());
      await firebaseOrdersCollection.add(order.toJson());
    } catch (e) {
      throw e;
    }
    // await firebaseOrdersCollection.doc(user?.uid).set(order.toJson());
    showToast(message: "Your order has been placed succesfully");
  }
}

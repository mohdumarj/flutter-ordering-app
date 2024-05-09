import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/ShoppingCart.dart';

import '../Pages/UserManagement/CustomerUser/LoginPage.dart';
import 'CartDetailsWithCheckout/CartDetailsWithCheckoutPage.dart';
import 'UserManagement/CustomerUser/CustomerPage.dart';
// import '../UserManagement/CustomerUser/LoginPage.dart';

class AccountPage extends StatelessWidget {
  var customerInformation = ShoppingCart().getUserInformation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50, // Adjust the radius
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Add your image URL here
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 30),
            _SectionTitle(title: "Customer Infromation "),
            _InfoRow(label: 'Name', value: customerInformation.username!.toUpperCase() ),
            _InfoRow(label: 'Email', value: customerInformation.email!),
            _InfoRow(label: 'Phone', value: customerInformation.phoneNumber!),
            SizedBox(height: 20),
            // _SectionTitle(title: 'Address Information'),
            // _InfoRow(label: 'Address', value: customerInformation.),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.redAccent, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),

                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Tooltip(
                message: 'Home',
                child: IconButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerPage()),
                    );
                  },
                  icon: Icon(Icons.home),
                ),
              ),
              Tooltip(
                message: 'Shopping Cart',
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartDetailsWithCheckoutPage()),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
              Tooltip(
                message: 'Account',
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountPage()),
                    );
                  },
                  icon: Icon(Icons.account_circle),
                ),
              ),
            ],
          ),
        )

    );

  }
  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('User logged out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('$label:', style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }

}

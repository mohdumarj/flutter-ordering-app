import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Entities/ShoppingCart.dart';
import 'package:untitled9/Entities/UsersModel.dart';

import '../../../../FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import '../../../../Globals/Common/Toast.dart';
import '../../Restaurants/RestaurantsList.dart';
import 'CustomerPage.dart';
import '../../ForgotPasswordPage.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSignin = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: Text('Forgot Password?'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('Does not have an account?'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                _signIn();
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      isSignin = true;
    });

    String email = _emailController.text = "mohd.umarj@gmail.com";
    String password = _passwordController.text = "123456";

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSignin = false;
    });
    if (user != null) {
      var userProfile = await getUserDataWithId(user.uid);
      if (userProfile != null) {
        if(userProfile.userType?.toLowerCase() != "customer"){
          //Logout user and show message that invalid user type
          await FirebaseAuth.instance.signOut();
          showToast(message: "User does not have privilege to use this feature");
          return;
        }
      }
      showToast(message: "User has successfully been verified");
      Navigator.pushReplacement(
        context,
        //MaterialPageRoute(builder: (context) => RestaurantScreen()),//CustomerPage(data: userProfile?.username ?? 'Customer')),
        MaterialPageRoute(builder: (context) => CustomerPage(data: userProfile?.username ?? 'Customer')),
      );

    } else {
      showToast(message: "An error occured, do you have an account?");
    }
  }

  Future<UsersModel?> getUserDataWithId(String userId) async {
    try {
      // Get a reference to the Firestore document using the provided document ID
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Users') // Change 'restaurants' to your collection name
          .doc(userId)
          .get();
      // Check if the document exists
      if (documentSnapshot.exists) {
        // Access data from the document
        //print('Document data: ${documentSnapshot.data()}');
        UsersModel user = UsersModel.fromDocumentSnapshot(documentSnapshot);
        ShoppingCart().setUserInformation(user);
        return user;
      } else {
        showToast(message: 'User profile does not exist, please contact support');
        return null;
      }
    } catch (e) {
      showToast(message: 'Error getting user profile: $e');
    }
  }
}


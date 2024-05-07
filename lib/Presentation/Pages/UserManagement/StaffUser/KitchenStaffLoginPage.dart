import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Entities/ShoppingCart.dart';
import '../../../../Entities/UsersModel.dart';
import '../../../../FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import '../../../../Globals/Common/Toast.dart';
import '../../ForgotPasswordPage.dart';
import '../../KitchenManagement/KitchenDashboardPage.dart';
import '../SignUp/StaffSignUpPage.dart';
// import '../../StaffSignUpPage.dart';

class KitchenStaffLoginPage extends StatefulWidget {
  @override
  State<KitchenStaffLoginPage> createState() => _KitchenStaffLoginPageState();
}

class _KitchenStaffLoginPageState extends State<KitchenStaffLoginPage> {
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
        title: Text('Kitchen Staff Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 10), // Reduced space before the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigate to Forgot Password Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: Text('Forgot Password?'),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign Up Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StaffSignUpPage(data: "KitchenStaff")),
                    );
                  },
                  child: Text('Does not have an account?'),
                ),
              ],
            ),
            SizedBox(height: 20), // Additional space before the Log In button
            ElevatedButton(
              onPressed: () {
                _signIn();
                // Navigate to Kitchen Dashboard
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => KitchenDashboardPage()),
                // );
              },
              child: Text('Log In', style: TextStyle(fontSize: 18)), // Slightly reduced font size
              style: ElevatedButton.styleFrom(
                minimumSize: Size(180, 50), // Slightly smaller size
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12), // Adjusted padding
              ),
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

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSignin = false;
    });
    if (user != null) {
      var userProfile = await getUserDataWithId(user.uid);
      if (userProfile != null) {
        if(userProfile.userType?.toLowerCase() != "waiter"){
          //Logout user and show message that invalid user type
          await FirebaseAuth.instance.signOut();
          showToast(message: "User does not have privilege to use this feature");
          return;
        }
      }
      showToast(message: "User has successfully been verified");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => KitchenDashboardPage()),//data: userProfile?.username ?? 'Waiter')),
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
        //saving userinformatuion in Cart Singleton object for scope of loggedin session.
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
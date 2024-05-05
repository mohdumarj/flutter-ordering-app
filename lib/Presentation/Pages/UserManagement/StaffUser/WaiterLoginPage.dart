import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../Entities/UsersModel.dart';
import '../../../../FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import '../../../../Globals/Common/Toast.dart';
import '../CustomerUser/CustomerPage.dart';
import '../../ForgotPasswordPage.dart';
import '../SignUp/StaffSignUpPage.dart';
// import '../../StaffSignUpPage.dart';

class WaiterLoginPage extends StatefulWidget {
  const WaiterLoginPage({super.key});

  @override
  State<WaiterLoginPage> createState() => _WaiterLoginPageState();
}

class _WaiterLoginPageState extends State<WaiterLoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
        title: const Text('Waiter Login '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 10), // Reduced space before the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigate to Forgot Password Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign Up Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StaffSignUpPage(data:"Waiter")),
                    );
                  },
                  child: const Text('Does not have an account?'),
                ),
              ],
            ),
            const SizedBox(height: 20), // Additional space before the Log In button
            ElevatedButton(
              onPressed: () {

                _signIn();
                // Navigate to Kitchen Dashboard

              }, // Slightly reduced font size
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(180, 50), // Slightly smaller size
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12), // Adjusted padding
              ),
              child: const Text('Log In', style: TextStyle(fontSize: 18)),
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
        MaterialPageRoute(builder: (context) => CustomerPage(data: userProfile?.username ?? 'Waiter')),
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
        return user;
      } else {
        showToast(message: 'User profile does not exist, please contact support');
        return null;
      }
    } catch (e) {
      showToast(message: 'Error getting user profile: $e');
    }
    return null;
  }
}
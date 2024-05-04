import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled9/Entities/UsersModel.dart';
import 'package:untitled9/FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import 'package:untitled9/Presentation/Pages/UserManagement/CustomerUser/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../Globals/Common/Toast.dart';
import '../../CustomerPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  bool isSigningUp = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  //@Override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _usernameController,

              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,

              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,

              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _phoneNumberController,

              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _signUp();
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CustomerPage()),
                    // );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _signUp() async {

    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;
    String confirmPassword = _confirmPasswordController.text;
    String phoneNumber = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created. Please login to proceed.");
     // Navigator.pushNamed(context, "/home");

      _createUser(UsersModel(
          id : user.uid,
          username : username,
          userType : "Customer",
          email : email,
          phoneNumber : phoneNumber
      ));

      Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
    } else {
      showToast(message: "Some error happend");
    }
  }

  Future<void> _createUser(UsersModel usersModel) async {
    try {

      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      // Reference to the Firestore collection
      CollectionReference users = FirebaseFirestore.instance.collection('Users');

      // Add a new document with the user's UID as the document ID
      final newUser = UsersModel(
          id: usersModel.id,
          username : usersModel.username,
          userType: usersModel.userType,
          email: usersModel.email,
          phoneNumber: usersModel.phoneNumber
      );

      await users.doc(user?.uid).set(newUser.toJson());

      showToast(message: 'User profile has been added');
    } catch (e) {
      showToast(message: 'Error adding user to Firestore: $e');
    }
    // final usersCollection = FirebaseFirestore.instance.collection("Users");
    //
    // final newUser = UsersModel(
    //     id: usersModel.id,
    //     username : usersModel.username,
    //     userType: usersModel.userType,
    //     email: usersModel.email,
    //     phoneNumber: usersModel.phoneNumber
    // );
    // usersCollection.doc("Users").set(newUser.toJson());
  }
}


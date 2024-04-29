import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import '../../../../Globals/Common/Toast.dart';
import '../../CustomerPage.dart';
import '../../ForgotPasswordPage.dart';
import '../SignUp/StaffSignUpPage.dart';
// import '../../StaffSignUpPage.dart';

class WaiterLoginPage extends StatefulWidget {
  @override
  State<WaiterLoginPage> createState() => _WaiterLoginPageState();
}

class _WaiterLoginPageState extends State<WaiterLoginPage> {
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
        title: Text('Waiter Login '),
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
                      MaterialPageRoute(builder: (context) => StaffSignUpPage()),
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
      showToast(message: "User has successfully been verified");
      // Navigator.pushNamed(context, "/home");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomerPage()),
      );
    } else {
      showToast(message: "An error occured, do you have an account?");
    }
  }
}
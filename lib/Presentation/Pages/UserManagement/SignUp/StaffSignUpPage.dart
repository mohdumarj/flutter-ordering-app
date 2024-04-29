import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import '../../../../Globals/Common/Toast.dart';
import '../CustomerUser/LoginPage.dart';


class StaffSignUpPage extends StatefulWidget {
  @override
  State<StaffSignUpPage> createState() => _StaffSignUpPageState();
}

class _StaffSignUpPageState extends State<StaffSignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  //Restaurant Name
  TextEditingController _resturantNameController = TextEditingController();
  //Restaurant License
  TextEditingController _resturantLicenseNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  bool isSigningUp = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _resturantNameController.dispose();
    _resturantLicenseNumberController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }
  // @Override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _resturantNameController,
              decoration: InputDecoration(
                labelText: 'Restaurant Name',
              ),
            ),
            TextField(
              controller: _resturantLicenseNumberController,

              decoration: InputDecoration(
                labelText: 'Restaurant License',
              ),
            ),
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
                    // Implement sign-up functionality for staff members
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

    String resturantName = _resturantNameController.text;
    String resturantLicenseNumner = _resturantLicenseNumberController.text;
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

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      showToast(message: "Some error happend");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:AmmarQiuckServe/Presentation/Pages/UserManagement/StaffUser/KitchenStaffLoginPage.dart';
import 'package:AmmarQiuckServe/Presentation/Pages/UserManagement/StaffUser/WaiterLoginPage.dart';

import '../../../../Entities/UsersModel.dart';
import '../../../../FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import '../../../../Globals/Common/Toast.dart';


class StaffSignUpPage extends StatefulWidget {

  final dynamic data;

  const StaffSignUpPage({super.key, required this.data});

  @override
  State<StaffSignUpPage> createState() => _StaffSignUpPageState();
}

class _StaffSignUpPageState extends State<StaffSignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  //Restaurant Name
  final TextEditingController _resturantNameController = TextEditingController();
  //Restaurant License
  final TextEditingController _resturantLicenseNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool isSigningUp = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _resturantNameController.dispose();
    _resturantLicenseNumberController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }
  // @Override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _resturantNameController,
              decoration: const InputDecoration(
                labelText: 'Restaurant Name',
              ),
            ),
            TextField(
              controller: _resturantLicenseNumberController,

              decoration: const InputDecoration(
                labelText: 'Restaurant License',
              ),
            ),
            TextField(
              controller: _emailController,

              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _emailController,

              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,

              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,

              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _phoneNumberController,

              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _signUp();
                    // Implement sign-up functionality for staff members
                  },
                  child: const Text('Sign Up'),
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
    String resturantLicenseNumber = _resturantLicenseNumberController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;
    String confirmPassword = _confirmPasswordController.text;
    String phoneNumber = _passwordController.text;

    if(password != confirmPassword ){
      showToast(message: "Password mismatch error");
    }else {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      setState(() {
        isSigningUp = false;
      });
      if (user != null) {
        showToast(message: widget.data + " User is successfully created. Please login to proceed.");
        // Navigator.pushNamed(context, "/home");

        _createUser(UsersModel(
            id : "1",
            username : username,
            userType : widget.data,
            email : email,
            phoneNumber : phoneNumber
        ));

        if(widget.data == "Waiter"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WaiterLoginPage()),
          );
        }else if(widget.data == "KitchenStaff"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const KitchenStaffLoginPage()),
          );
        }

      } else {
        showToast(message: "Some error happend");
      }
    }


  }
  void _createUser(UsersModel usersModel) {
    final usersCollection = FirebaseFirestore.instance.collection("Users");
    String id = usersCollection.doc().id;
    final newUser = UsersModel(
        id: id,
        username : usersModel.username,
        userType: usersModel.userType,
        email: usersModel.email,
        phoneNumber: usersModel.phoneNumber
    );
    usersCollection.doc("Users").set(newUser.toJson());
  }
}

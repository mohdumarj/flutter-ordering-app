import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled9/Entities/UsersModel.dart';
import 'package:untitled9/FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import 'package:untitled9/Presentation/Pages/UserManagement/CustomerUser/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../Globals/Common/Toast.dart';

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
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
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
            buildTextField(_emailController, 'Email', false, TextInputType.emailAddress),
            buildTextField(_nameController, 'Name', false, TextInputType.text),
            buildTextField(_usernameController, 'Username', false, TextInputType.text),
            buildTextField(_passwordController, 'Password', true, TextInputType.text),
            buildTextField(_confirmPasswordController, 'Confirm Password', true, TextInputType.text),
            buildTextField(_phoneNumberController, 'Phone Number', false, TextInputType.phone, digitsOnly: true),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (validateFields()) {
                      _signUp();
                    }
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

  TextField buildTextField(TextEditingController controller, String label, bool obscureText, TextInputType keyboardType, {bool digitsOnly = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        errorText: controller.text.isEmpty ? 'This field cannot be empty' : null,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
    );
  }

  bool validateFields() {
    bool valid = true;
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      showToast(message: 'Please enter a valid email address');
      valid = false;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      showToast(message: 'Passwords do not match');
      valid = false;
    }
    if (_phoneNumberController.text.isEmpty || _phoneNumberController.text.length < 10) {
      showToast(message: 'Please enter a valid phone number');
      valid = false;
    }
    return valid;
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    User? user = await _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      showToast(message: "User is successfully created. Please login to proceed.");
      _createUser(UsersModel(
          id: user.uid,
          username: _usernameController.text,
          userType: "Customer",
          email: _emailController.text,
          phoneNumber: _phoneNumberController.text
      ));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      showToast(message: "Some error happened. Please try again.");
    }
  }

  Future<void> _createUser(UsersModel usersModel) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('Users');
      await users.doc(usersModel.id).set(usersModel.toJson());
      showToast(message: 'User profile has been added');
    } catch (e) {
      showToast(message: 'Error adding user to Firestore: $e');
    }
  }
}

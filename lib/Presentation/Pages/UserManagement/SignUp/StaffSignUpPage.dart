import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/Globals/Common/Globals.dart';
import 'package:untitled9/Presentation/Pages/UserManagement/StaffUser/KitchenStaffLoginPage.dart';
import 'package:untitled9/Presentation/Pages/UserManagement/StaffUser/WaiterLoginPage.dart';

import '../../../../Entities/RestaurantsModel.dart';
import '../../../../Entities/UsersModel.dart';
import '../../../../FirebaseAuthImplimentation/FirebaseAuthServices.dart';
import '../../../../Globals/Common/Toast.dart';
import '../CustomerUser/LoginPage.dart';


class StaffSignUpPage extends StatefulWidget {


 late RestaurantsModel? userSelectedRestaurant;
  final dynamic data;

  StaffSignUpPage({Key? key, required this.data}) : super(key: key);

  @override
  State<StaffSignUpPage> createState() => _StaffSignUpPageState();
}

class _StaffSignUpPageState extends State<StaffSignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  //Restaurant Name
  TextEditingController _resturantNameController = TextEditingController();
  //Restaurant License
  TextEditingController _resturantLicenseNumberController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
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
    _usernameController.dispose();
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
/////////////
            Text(
              'Select Restaurant',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
          Container(
          width: double.infinity, // Set width to fill the screen width
            child: FutureBuilder<List<RestaurantsModel>>(
              future: Globals().getRestaurantsFromCollection(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<RestaurantsModel> restaurantsList = snapshot.data!;
                  return DropdownButton<RestaurantsModel>(
                    hint: Text('Select a restaurant'),
                    onChanged: (RestaurantsModel? selectedRestaurant) {
                      print('Selected restaurant: ${selectedRestaurant!.name}');
                      widget.userSelectedRestaurant = selectedRestaurant;
                    },
                    items: restaurantsList.map<DropdownMenuItem<RestaurantsModel>>((RestaurantsModel restaurant) {
                      return DropdownMenuItem<RestaurantsModel>(
                        value: restaurant,
                        child: Text(restaurant.name!),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
           ///////////
           //  TextField(
           //    controller: _resturantNameController,
           //    decoration: InputDecoration(
           //      labelText: 'Restaurant Name',
           //    ),
           //  ),
           //  TextField(
           //    controller: _resturantLicenseNumberController,
           //
           //    decoration: InputDecoration(
           //      labelText: 'Restaurant License',
           //    ),
           //  ),
            TextField(
              controller: _emailController,

              decoration: InputDecoration(
                labelText: 'Username',
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

    String? resturantName = widget.userSelectedRestaurant?.name;
   // String resturantLicenseNumber = _resturantLicenseNumberController.text;
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
            phoneNumber : phoneNumber,
          restaurant: widget.userSelectedRestaurant,
        ));

        if(widget.data == "Waiter"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WaiterLoginPage()),
          );
        }else if(widget.data == "KitchenStaff"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => KitchenStaffLoginPage()),
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
        phoneNumber: usersModel.phoneNumber,
      restaurant: widget.userSelectedRestaurant,
    );
    usersCollection.doc("Users").set(newUser.toJson());
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ForgotPasswordPage.dart';
import '../../KitchenDashboardPage.dart';
import '../SignUp/StaffSignUpPage.dart';
// import '../../StaffSignUpPage.dart';

class KitchenStaffLoginPage extends StatelessWidget {
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
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
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
                // Navigate to Kitchen Dashboard
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => KitchenDashboardPage()),
                );
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
}
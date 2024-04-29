import 'package:flutter/material.dart';


class StaffSignUpPage extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Restaurant Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Restaurant License',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            TextField(
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
}

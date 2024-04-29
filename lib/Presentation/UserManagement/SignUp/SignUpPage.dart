import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../CustomerPage.dart';

class SignUpPage extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerPage()),
                    );
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

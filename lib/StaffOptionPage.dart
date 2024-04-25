
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ForgotPasswordPage.dart';
import 'KitchenStaffLoginPage.dart';
import 'WaiterLoginPage.dart';

class StaffOptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WaiterLoginPage())),
              child: Text('Waiter', style: TextStyle(fontSize: 20)), // Adjust font size
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Adjust button size
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Adjust button padding
              ),
            ),
            SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => KitchenStaffLoginPage())),
              child: Text('Kitchen Staff', style: TextStyle(fontSize: 20)), // Adjust font size
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), // Adjust button size
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Adjust button padding
              ),
            ),
          ],
        ),
      ),
    );
  }
}

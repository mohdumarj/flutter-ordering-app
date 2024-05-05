import 'package:flutter/material.dart';

import 'UserManagement/StaffUser/StaffOptionPage.dart';
import '../Pages/UserManagement/CustomerUser/LoginPage.dart';

// import '../UserManagement/CustomerUser/LoginPage.dart';
// import '../StaffOptionPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuickServe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StaffOptionPage())),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Staff', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ), // Navigate to Customer Login Page
              child: const Text('CustomerUser', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

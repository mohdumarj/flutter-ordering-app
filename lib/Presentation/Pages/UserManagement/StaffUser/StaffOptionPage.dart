
import 'package:flutter/material.dart';

import 'KitchenStaffLoginPage.dart';
import 'WaiterLoginPage.dart';

// import '../UserManagement/StaffUser/KitchenStaffLoginPage.dart';
// import '../UserManagement/StaffUser/WaiterLoginPage.dart';

class StaffOptionPage extends StatelessWidget {
  const StaffOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WaiterLoginPage())), // Adjust font size
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60), // Adjust button size
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Adjust button padding
              ),
              child: const Text('Waiter', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const KitchenStaffLoginPage())), // Adjust font size
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60), // Adjust button size
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Adjust button padding
              ),
              child: const Text('Kitchen Staff', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

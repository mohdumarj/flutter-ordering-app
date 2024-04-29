import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserManagement/CustomerUser/LoginPage.dart';
// import '../UserManagement/CustomerUser/LoginPage.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50, // Adjust the radius
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Add your image URL here
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 30),
            _SectionTitle(title: 'Personal Information'),
            _InfoRow(label: 'Name', value: 'John Doe'),
            _InfoRow(label: 'Email', value: 'johndoe@example.com'),
            _InfoRow(label: 'Phone', value: '+1234567890'),
            SizedBox(height: 20),
            _SectionTitle(title: 'Address Information'),
            _InfoRow(label: 'Address', value: '123 Main St, City, Country'),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.redAccent, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('$label:', style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}

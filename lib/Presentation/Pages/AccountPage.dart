import 'package:flutter/material.dart';

import '../Pages/UserManagement/CustomerUser/LoginPage.dart';
// import '../UserManagement/CustomerUser/LoginPage.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50, // Adjust the radius
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Add your image URL here
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 30),
            const _SectionTitle(title: 'Personal Information'),
            const _InfoRow(label: 'Name', value: 'John Doe'),
            const _InfoRow(label: 'Email', value: 'johndoe@example.com'),
            const _InfoRow(label: 'Phone', value: '+1234567890'),
            const SizedBox(height: 20),
            const _SectionTitle(title: 'Address Information'),
            const _InfoRow(label: 'Address', value: '123 Main St, City, Country'),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.redAccent, // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Log Out'),
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

  const _SectionTitle({required this.title});

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

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}

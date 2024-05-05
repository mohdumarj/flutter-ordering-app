import 'package:flutter/material.dart';

import '../Pages/BaitAlMadkohoutPage.dart';
import '../Pages/RestaurantLabelPage.dart';

class AsianFoodPage extends StatelessWidget {
  const AsianFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asian Food'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the button if it's only one
          children: [
            RestaurantLabel(
              label: 'Bait Al Madkohout',
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BaitAlMadkohoutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
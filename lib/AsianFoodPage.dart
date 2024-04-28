import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BaitAlMadkohoutPage.dart';
import 'RestaurantLabelPage.dart';

class AsianFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asian Food'),
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
                  MaterialPageRoute(builder: (context) => BaitAlMadkohoutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
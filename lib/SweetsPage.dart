import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cafe42Page.dart';
import 'RestaurantLabelPage.dart';

class SweetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sweets'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the button if it's only one
          children: [
            RestaurantLabel(
              label: '42 Cafe',
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cafe42Page()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

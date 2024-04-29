import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../BaithAlShaypage.dart';
// import '../Cafe42Page.dart';
import 'BaithAlShaypage.dart';
import 'Cafe42Page.dart';
import 'RestaurantLabelPage.dart';

class BeveragesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beverages'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RestaurantLabel(
              label: 'Baith Al Shay',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BaithAlShaypage()),
                );
              },
            ),
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

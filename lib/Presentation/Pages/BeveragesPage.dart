import 'package:flutter/material.dart';

// import '../BaithAlShaypage.dart';
// import '../Cafe42Page.dart';
import '../Pages/BaithAlShaypage.dart';
import '../Pages/Cafe42Page.dart';
import 'RestaurantLabelPage.dart';

class BeveragesPage extends StatelessWidget {
  const BeveragesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beverages'),
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
                  MaterialPageRoute(builder: (context) => const BaithAlShaypage()),
                );
              },
            ),
            RestaurantLabel(
              label: '42 Cafe',
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cafe42Page()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

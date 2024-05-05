import 'package:flutter/material.dart';

// import '../BaithAlShaypage.dart';
// import '../NafahatBurgerPage.dart';
import '../Pages/BaithAlShaypage.dart';
import '../Pages/NafahatBurgerPage.dart';
import 'RestaurantLabelPage.dart';
class FastFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast Food'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Centers the buttons horizontally with even spacing
          children: [
            // RestaurantLabel(
            //   label: 'NAFAHAT BURGER',
            //   color: Colors.orange,
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => NafahatBurgerPage()),
            //     );
            //   },
            // ),
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
          ],
        ),
      ),
    );
  }
}

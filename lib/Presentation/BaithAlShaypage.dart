import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MenuItemCard.dart';

// import '../MenuItemCard.dart';

class BaithAlShaypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('baith al shay'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Column(
              children: [
                MenuItemCard(
                  name: 'Francisco Porotta',
                  price: 0.600,
                  description: 'Our special paratha sandwiches with special sauces.',
                ),
                MenuItemCard(
                  name: 'Combo French Fries',
                  price: 0.360,
                  description: 'Small pouch of French fries.',
                ),
                MenuItemCard(
                  name: 'Holland Fries',
                  price: 1.00,
                  description: 'Fries topped with special sauces and mixed with meat or chicken.',
                ),
                MenuItemCard(
                  name: 'Cheese With Oman Chips Poratta',
                  price: 0.300,
                  description: 'Cheese With Oman Chips Poratta.',
                ),
                MenuItemCard(
                  name: 'Cheese With Eggs Poratta',
                  price: 0.360,
                  description: 'Cheese With Eggs Poratta',
                ),
                MenuItemCard(
                  name: 'Cheese With Honey Fatheera',
                  price: 0.600,
                  description: 'Cheese With Honey Fatheera',
                ),
                MenuItemCard(
                  name: 'Vegetables Samosa 1 Pcs',
                  price: 0.065,
                  description: 'Per piece rate',
                ),


                MenuItemCard(
                  name: 'Corn Flakes Kelloggs',
                  price: 0.650,
                  description: 'Big cup of cornflakes soaked in hot milk.',
                ),
                MenuItemCard(
                  name: 'Croissant Cheese Oman Chips',
                  price: 0.360,
                  description: 'Croissant filled with cheese and Oman chips.',
                ),
                MenuItemCard(
                  name: 'Croissant Chilli',
                  price: 0.500,
                  description: 'Croissant Chilli',
                ),


                MenuItemCard(
                  name: 'Fries Holland',
                  price: 1.00, // Price on Selection
                  description: 'Fries topped with special sauces and mixed with meat or chicken.',
                ),
                MenuItemCard(
                  name: 'Twister Wrap Sandwich',
                  price: 1.200,
                  description: 'A flavorful and satisfying sandwich filled with tender chicken strips, fresh lettuce, and a tangy sauce, all wrapped in a warm tortilla.',
                ),


                MenuItemCard(
                  name: 'Kebab Wrap Sandwich',
                  price: 0.960,
                  description: 'Wrap sandwich filled with kebabs.',
                ),

                MenuItemCard(
                  name: 'Zinger Supreme Sandwich',
                  price: 1.140,
                  description: 'Sandwich made with spicy fried chicken patty served with a variety of toppings and sauces.',
                ),


                MenuItemCard(
                  name: 'Chicken Burger',
                  price: 0.840,
                  description: 'Made with a juicy, tender, and flavorful chicken patty, topped with fresh vegetables, and sauce. it\'s a perfect meal for lunch or dinner.',
                ),

                MenuItemCard(
                  name: 'Cheese Poratta',
                  price: 0.240,
                  description: 'Popular Indian dish made with a whole wheat flour dough, filled with a spiced potato and cheese mixture.',
                ),
                MenuItemCard(
                  name: 'Chili Poratta',
                  price: 0.480,
                  description: 'Bread filled with spicy chili filling.',
                ),

                MenuItemCard(
                  name: 'Cheese With Honey Regag',
                  price: 0.360,
                  description: 'Cheese With Honey Regag',
                ),

                MenuItemCard(
                  name: 'Cheese With Nutella Regag',
                  price: 0.480,
                  description: 'Cheese With Nutella Regag',
                ),

                MenuItemCard(
                  name: 'Cheese With Honey Fatheera',
                  price: 0.600,
                  description: 'Cheese With Honey Fatheera',
                ),
                MenuItemCard(
                  name: 'Eggs With Cheese Fatheera',
                  price: 0.720,
                  description: 'Cheese With Honey Fatheera',
                ),

                MenuItemCard(
                  name: 'Chicken Strips Piece',
                  price: 0.400,
                  description: 'Marinated chicken tender strips.',
                ),

                MenuItemCard(
                  name: 'Orange Juice',
                  price: 0.720,
                  description: 'Made capturing all the natural sweetness and tangy citrus flavor. Packed with Vitamin C.',
                ),

                MenuItemCard(
                  name: 'Lemon With Mint Juice',
                  price: 0.720,
                  description: 'Made with a blend of fresh lemons, mint leaves, and a touch of sweetness.',
                ),
                MenuItemCard(
                  name: 'Cocktail Juice',
                  price: 0.840,
                  description: 'Made with a blend of seasonal fruits. A healthy and delicious option.',
                ),

                MenuItemCard(
                  name: 'Passion Fruit Mojito',
                  price: 1.050,
                  description: 'Made with passion fruit, lime, mint and a splash of soda water.',
                ),

                MenuItemCard(
                  name: 'Blueberry Mojito',
                  price: 1.050,
                  description: 'Made with fresh blueberries, mint leaves, lime juice and a splash for soda.',
                ),

                MenuItemCard(
                  name: 'Black Coffee',
                  price: 0.480,
                  description: 'Enjoy the bold and rich flavor of our black coffee for a truly invigorating experience!',
                ),
                MenuItemCard(
                  name: 'Cappuccino',
                  price: 0.600,
                  description: 'Made with espresso and steamed milk creating rich, velvety taste.',
                ),



              ],
            ),
          ],
        ),
      ),
    );
  }
}


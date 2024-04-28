import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MenuItemCard.dart';

class Cafe42Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('42 Cafe'),
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
                  name: 'Matcha Latte',
                  price: 1.600,
                  description: 'Original Matcha powder mixed with Milk',
                ),
                MenuItemCard(
                  name: 'Foamy Caramel',
                  price: 1.600,
                  description: 'Caramel latte with rich sweet cream',
                ),
                MenuItemCard(
                  name: 'WHITE CHOCOLATE FRAPPUCCINO',
                  price: 1.800,
                  description: 'The Great taste of white chocolate with whipping cream and espresso.',
                ),
                MenuItemCard(
                  name: 'ESPRESSO',
                  price: 0.700,
                  description: 'Our coffee blend (peru)(fruity/cocao)',
                ),
                MenuItemCard(
                  name: 'Americano',
                  price: 1.000,
                  description: 'Double shot espresso with water.',
                ),
                MenuItemCard(
                  name: 'LATTE',
                  price: 1.300,
                  description: 'Double espresso with steamed milk',
                ),
                MenuItemCard(
                  name: 'COLD BREW',
                  price: 1.500,
                  description: 'Ethiopian beans',
                ),
                MenuItemCard(
                  name: 'V60',
                  price: 1.500,
                  description: 'Filterd Coffee',
                ),
                MenuItemCard(
                  name: 'CORTADO',
                  price: 1.000,
                  description: 'Double shot of espresso with milk in 6.5 oz',
                ),
                MenuItemCard(
                  name: 'MACCHIATO',
                  price: 0.900,
                  description: 'Double shot of espresso with a stain of milk foam',
                ),
                MenuItemCard(
                  name: 'PICOLO',
                  price: 0.900,
                  description: 'Single shot of espresso with milk',
                ),
                MenuItemCard(
                  name: 'FLAT WHITE',
                  price: 1.000,
                  description: 'Double espresso with less foamed milk',
                ),
                MenuItemCard(
                  name: 'CAPPUCCINO',
                  price: 1.300,
                  description: 'Double espresso with more foamed milk',
                ),
                MenuItemCard(
                  name: 'SPANISH LATTE',
                  price: 1.500,
                  description: 'Latte with condensed milk flavour',
                ),
                MenuItemCard(
                  name: 'Penut Butter Latte',
                  price: 1.600,
                  description: 'Latte with the tasty peanut butter taste.',
                ),
                MenuItemCard(
                  name: 'ICED SHAKEN WHITE MOCHA',
                  price: 1.600,
                  description: 'White chocolate and milk shaken with double espresso',
                ),
                MenuItemCard(
                  name: 'TOGO SIGNATURE',
                  price: 1.600,
                  description: 'Iced americano with hazelnut and vanila flavoured milk foam',
                ),
                MenuItemCard(
                  name: 'Brownies',
                  price: 1.200,
                  description: '1 piece of dark chocolate brownies',
                ),
                MenuItemCard(
                  name: 'Date Cake Dessert',
                  price: 1.900,
                  description: 'Date cake with sweet cream topping and nuts',
                ),
                MenuItemCard(
                  name: 'Cookies Dessert',
                  price: 1.200,
                  description: 'Milk chocolate cookies',
                ),
                MenuItemCard(
                  name: 'Chesse Croissant.',
                  price: 1.300,
                  description: 'Baked Croissant stuffed with cheddar cheese.',
                ),
                MenuItemCard(
                  name: 'Haloumi Cheese Sandwich',
                  price: 1.200,
                  description: 'Halloumi cheese and tomato stuffed In bread.',
                ),
                MenuItemCard(
                  name: 'Chicken Fajita Sandwich',
                  price: 1.200,
                  description: 'Chicken cooked with spices stuffed in bread',
                ),
                MenuItemCard(
                  name: 'Peanut Butter Frappuccino',
                  price: 1.900,
                  description: 'Mix of espresso and peanut butter with whip cream.',
                ),
                MenuItemCard(
                  name: 'Pomegranate frappe',
                  price: 1.700,
                  description: 'Milk with pomegrante and whipping cream',
                ),
                MenuItemCard(
                  name: 'CARAMEL FRAPPUCCINO',
                  price: 1.800,
                  description: 'Caramel concentrated flavoured frappuccino',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

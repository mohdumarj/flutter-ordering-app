import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MenuItemCard.dart';

class BaitAlMadkohoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bait Al Madkohout'),
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
                  name: 'Half Fresh Pressed Chicken With Rice',
                  price: 2.200,
                  description: 'The chicken is cooked with rice and is characterized by the delicious flavor of madgout spices.',
                ),
                MenuItemCard(
                  name: 'Half Fresh Charcoal Chicken',
                  price: 2.200,
                  description: 'Served With Bukhari Rice',
                ),
                MenuItemCard(
                  name: 'Hashi Nafar Moqalqal',
                  price: 3.550,
                  description: 'Served With Bashawar rice',
                ),
                MenuItemCard(
                  name: 'Half Fresh Charcoal Chicken',
                  price: 2.200,
                  description: 'Served With Zurbian Rice',
                ),
                MenuItemCard(
                  name: 'Muqlqal Hashi',
                  price: 3.550,
                  description: 'Served with bukhari rice',
                ),
                MenuItemCard(
                  name: 'Bukhari Rice',
                  price: 0.700,
                  description: 'Bukhari Rice',
                ),
                MenuItemCard(
                  name: 'Half Fresh Pressed Chicken With Rice',
                  price: 2.200,
                  description: 'The chicken is cooked with rice and is characterized by the delicious flavor of madgout spices.',
                ),
                MenuItemCard(
                  name: 'Hashi Nafar Moqalqal',
                  price: 3.550,
                  description: 'Served With Bashawar rice',
                ),
                MenuItemCard(
                  name: 'Muqlqal Hashi',
                  price: 3.550,
                  description: 'Served with bukhari rice',
                ),
                MenuItemCard(
                  name: 'Half Fresh Charcoal Chicken',
                  price: 2.200,
                  description: 'Served With Bashawar rice',
                ),
                MenuItemCard(
                  name: 'Half Charcoal Chicken',
                  price: 2.200,
                  description: 'Half chicken served with rice.',
                ),
                MenuItemCard(
                  name: 'Half Fresh Charcoal Chicken',
                  price: 2.200,
                  description: 'Served With Zurbian Rice',
                ),
                MenuItemCard(
                  name: 'Half Fresh Charcoal Chicken',
                  price: 2.200,
                  description: 'Served With Bukhari Rice',
                ),
                MenuItemCard(
                  name: 'Bashawer Rice',
                  price: 0.700,
                  description: 'For 1 person',
                ),
                MenuItemCard(
                  name: 'Bukhari Rice',
                  price: 0.700,
                  description: 'Served With Bashawar rice',
                ),
                MenuItemCard(
                  name: 'Hadrami Rice',
                  price: 0.700,
                  description: 'Served With Bashawar rice',
                ),
                MenuItemCard(
                  name: 'Cucumber Yogurt Sauce',
                  price: 0.300,
                  description: 'Cucumber Yogurt Sauce',
                ),
                MenuItemCard(
                  name: 'Sumatra Yoghurt Sauce',
                  price: 0.300,
                  description: 'Yoghurt Sauce',
                ),
                MenuItemCard(
                  name: 'Maabouj Sauce',
                  price: 0.300,
                  description: 'Kuwaiti maabouj with olive oil for spicy lovers',
                ),
                MenuItemCard(
                  name: 'Tahini Sauce',
                  price: 0.300,
                  description: 'Made from roasted sesame seeds, this versatile condiment adds a nutty, savory flavor to salads, sandwiches, and more.',
                ),
                MenuItemCard(
                  name: 'Green Salad',
                  price: 0.300,
                  description: 'Healthy and delicious - made from a variety of fresh greens that can be topped with a dressing to add flavor and nutrition. it\'s a great option for a light lunch or as a side dish to complement any meal.',
                ),
                MenuItemCard(
                  name: 'Cream Konafa',
                  price: 1.100,
                  description: 'Cream',
                ),
                MenuItemCard(
                  name: 'Areeka Malaki',
                  price: 4.100,
                  description: 'With cream, honey, and a sprinkle of almonds and cashews',
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
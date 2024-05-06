import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled9/Entities/RestaurantMenuModel.dart';
import 'package:untitled9/Entities/RestaurantsModel.dart';

import '../../Entities/MenuItemModel.dart';
import 'Toast.dart';

class Globals {
  final firestoreGlobalInstance = FirebaseFirestore.instance;

  Future<void> AppInit() async {
    final restaurantsCollection = firestoreGlobalInstance.collection('Restaurants');

    // Baith Al Shay
    final List<MenuItemModel> baithAlShayCroissantItems = [
      MenuItemModel(
        id: "1",
        name: "Croissant Cheese Oman Chips",
        description: "Croissant filled with cheese and Oman chips.",
        price: "0.36 OMR",
        category: "Croissant Sandwiches",
      ),
      MenuItemModel(
        id: "2",
        name: "CROISSANT NORMAL",
        description: "Standard croissant.",
        price: "0.195 OMR",
        category: "Croissant Sandwiches",
      ),
      MenuItemModel(
        id: "3",
        name: "Croissant Cheese",
        description: "Flaky pastry filled with melted cheese.",
        price: "0.26 OMR",
        category: "Croissant Sandwiches",
      ),
      MenuItemModel(
        id: "4",
        name: "Croissant Francisco",
        description: "Croissant Francisco.",
        price: "0.6 OMR",
        category: "Croissant Sandwiches",
      ),
      MenuItemModel(
        id: "5",
        name: "Croissant Chilli",
        description: "Croissant Chilli.",
        price: "0.5 OMR",
        category: "Croissant Sandwiches",
      ),
    ];

    final List<MenuItemModel> baithAlShayWrapItems = [
      MenuItemModel(
        id: "6",
        name: "Twister Wrap Sandwich",
        description: "Flavorful sandwich with chicken, lettuce, and tangy sauce in a tortilla.",
        price: "1.2 OMR",
        category: "Wrap And Tortilla",
      ),
      MenuItemModel(
        id: "7",
        name: "Grilled Twister Wrap Sandwich",
        description: "Grilled Twister Wrap Sandwich.",
        price: "1.26 OMR",
        category: "Wrap And Tortilla",
      ),
      MenuItemModel(
        id: "8",
        name: "Tikka Wrap Sandwich",
        description: "Filled with tikka chicken.",
        price: "0.96 OMR",
        category: "Wrap And Tortilla",
      ),
      MenuItemModel(
        id: "9",
        name: "Kebab Wrap Sandwich",
        description: "Filled with kebabs.",
        price: "0.96 OMR",
        category: "Wrap And Tortilla",
      ),
    ];

    final List<MenuItemModel> baithAlShaySupremeItems = [
      MenuItemModel(
        id: "10",
        name: "Broast Master Wrap Sandwich",
        description: "Broast Master Wrap Sandwich.",
        price: "1.32 OMR",
        category: "Supreme And Samoon",
      ),
      MenuItemModel(
        id: "11",
        name: "Zinger Supreme Sandwich",
        description: "Spicy fried chicken patty with toppings and sauces.",
        price: "1.14 OMR",
        category: "Supreme And Samoon",
      ),
      MenuItemModel(
        id: "12",
        name: "Grilled Chicken Tikka Supreme Sandwich",
        description: "Grilled Chicken Tikka Supreme Sandwich.",
        price: "0.96 OMR",
        category: "Supreme And Samoon",
      ),
      MenuItemModel(
        id: "13",
        name: "Hot Dog Supreme Sandwich",
        description: "Hot Dog Supreme Sandwich.",
        price: "0.72 OMR",
        category: "Supreme And Samoon",
      ),
      MenuItemModel(
        id: "14",
        name: "Mathafi Supreme Sandwich",
        description: "Mathafi Supreme Sandwich.",
        price: "1.44 OMR",
        category: "Supreme And Samoon",
      ),
    ];

    final List<MenuItemModel> baithAlShayBurgerItems = [
      MenuItemModel(
        id: "15",
        name: "Zinger Burger",
        description: "Spicy zinger burger with chicken, herbs, spices, and mayo.",
        price: "1.32 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "16",
        name: "Double Zinger Burger",
        description: "Double the zingy flavors.",
        price: "1.74 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "17",
        name: "Fillet Burger",
        description: "Chicken fillet with fillings and mayo.",
        price: "1.32 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "18",
        name: "Double Fillet Burger",
        description: "Two fillets.",
        price: "1.74 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "19",
        name: "Burger Mansoor Chicken",
        description: "Burger Mansoor Chicken.",
        price: "1.2 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "20",
        name: "Burger Mansoor Beef",
        description: "Burger Mansoor Beef.",
        price: "1.2 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "21",
        name: "Burger Mansoor Chicken Double",
        description: "Double chicken.",
        price: "1.56 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "22",
        name: "Burger Mansoor Beef Double",
        description: "Double beef.",
        price: "1.56 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "23",
        name: "Egg Burger",
        description: "Burger with scrambled eggs.",
        price: "0.36 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "24",
        name: "Beef Burger",
        description: "Juicy beef patty with vegetables and sauce.",
        price: "1.08 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "25",
        name: "Camel Burger",
        description: "Patty made from camel meat.",
        price: "1.2 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "26",
        name: "Double Beef Burger",
        description: "Two beef patties with toppings.",
        price: "1.44 OMR",
        category: "Burger",
      ),
      MenuItemModel(
        id: "27",
        name: "Double Camel Burger",
        description: "Double camel patty.",
        price: "1.56 OMR",
        category: "Burger",
      ),
    ];

    final List<MenuItemModel> baithAlShayPorattaItems = [
      MenuItemModel(
        id: "28",
        name: "Cheese Poratta",
        description: "Indian dish with spiced potato and cheese.",
        price: "0.24 OMR",
        category: "Poratta",
      ),
      MenuItemModel(
        id: "29",
        name: "Cheese With Eggs Poratta",
        description: "With eggs.",
        price: "0.36 OMR",
        category: "Poratta",
      ),
      MenuItemModel(
        id: "30",
        name: "Cheese With Oman Chips Poratta",
        description: "With Oman chips.",
        price: "0.3 OMR",
        category: "Poratta",
      ),
      MenuItemModel(
        id: "31",
        name: "Chili Poratta",
        description: "Filled with spicy chili.",
        price: "0.48 OMR",
        category: "Poratta",
      ),
      MenuItemModel(
        id: "32",
        name: "Tikka 65 Poratta",
        description: "Tikka 65 Poratta.",
        price: "0.48 OMR",
        category: "Poratta",
      ),
      MenuItemModel(
        id: "33",
        name: "Chicken Kebab Poratta",
        description: "With chicken kebabs.",
        price: "0.54 OMR",
        category: "Poratta",
      ),
      MenuItemModel(
        id: "34",
        name: "Beef Kebab Poratta",
        description: "With beef kebabs.",
        price: "0.54 OMR",
        category: "Poratta",
      ),
    ];

    final List<MenuItemModel> baithAlShayRegagItems = [
      MenuItemModel(
        id: "35",
        name: "Cheese With Honey Regag",
        description: "With honey.",
        price: "0.36 OMR",
        category: "Regag",
      ),
      MenuItemModel(
        id: "36",
        name: "Eggs With Cheese And Honey Regag",
        description: "With eggs, cheese, and honey.",
        price: "0.42 OMR",
        category: "Regag",
      ),
      MenuItemModel(
        id: "37",
        name: "Cheese With Zaatar Regag",
        description: "With Zaatar.",
        price: "0.36 OMR",
        category: "Regag",
      ),
      MenuItemModel(
        id: "38",
        name: "Cheese With Nutella Regag",
        description: "With Nutella.",
        price: "0.48 OMR",
        category: "Regag",
      ),
      MenuItemModel(
        id: "39",
        name: "Omani Ghee Regag",
        description: "With Omani ghee.",
        price: "0.25 OMR",
        category: "Regag",
      ),
      MenuItemModel(
        id: "40",
        name: "Regag Cheese Chips",
        description: "With cheese chips.",
        price: "0.375 OMR",
        category: "Regag",
      ),
    ];

    final List<MenuItemModel> baithAlShayMojitoItems = [
      MenuItemModel(
        id: "41",
        name: "Strawberry Mojito",
        description: "With strawberries, mint, and soda.",
        price: "1.05 OMR",
        category: "Mojito",
      ),
      MenuItemModel(
        id: "42",
        name: "Mix Berry Mojito",
        description: "With berries, mint, and soda.",
        price: "1.05 OMR",
        category: "Mojito",
      ),
      MenuItemModel(
        id: "43",
        name: "Lemon With Mint Mojito",
        description: "Citrusy with lemon, mint, and soda.",
        price: "1.05 OMR",
        category: "Mojito",
      ),
      MenuItemModel(
        id: "44",
        name: "Passion Fruit Mojito",
        description: "With passion fruit, mint, and soda.",
        price: "1.05 OMR",
        category: "Mojito",
      ),
      MenuItemModel(
        id: "45",
        name: "Pomegranate Mojito",
        description: "With pomegranate, mint, and soda.",
        price: "1.05 OMR",
        category: "Mojito",
      ),
      MenuItemModel(
        id: "46",
        name: "Blueberry Mojito",
        description: "With blueberries, mint, and soda.",
        price: "1.05 OMR",
        category: "Mojito",
      ),
    ];

    final RestaurantsModel baithAlShay = RestaurantsModel(
      id: "3",
      name: "Baith Al Shay",
      address: "Location A",
      email: "baithalshay@example.com",
      website: "www.baithalshay.om",
      phoneNumber: "123-1234567",
      menusList: [
        RestaurantMenuModel(
          id: "1",
          menuName: "Croissant Sandwiches",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baithAlShayCroissantItems,
        ),
        RestaurantMenuModel(
          id: "2",
          menuName: "Wrap and Tortilla",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baithAlShayWrapItems,
        ),
        RestaurantMenuModel(
          id: "3",
          menuName: "Supreme and Samoon",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baithAlShaySupremeItems,
        ),
        RestaurantMenuModel(
          id: "4",
          menuName: "Burger",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baithAlShayBurgerItems,
        ),
        RestaurantMenuModel(
          id: "5",
          menuName: "Poratta",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baithAlShayPorattaItems,
        ),
        RestaurantMenuModel(
          id: "6",
          menuName: "Regag",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baithAlShayRegagItems,
        ),
        RestaurantMenuModel(
          id: "7",
          menuName: "Mojito",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baithAlShayMojitoItems,
        ),
      ],
    );

    final List<MenuItemModel> nafhatBurgerBurgerItems = [
      MenuItemModel(
        id: "47",
        name: "Dynamite Shrimp",
        description: "Golden-fried shrimp in a spicy mayo sauce.",
        price: "1.9 OMR",
        category: "Burger & Sandwiches",
      ),
      MenuItemModel(
        id: "48",
        name: "Chicken Mozzarella Fingers",
        description: "Chicken Mozzarella Fingers.",
        price: "1.7 OMR",
        category: "Burger & Sandwiches",
      ),
      MenuItemModel(
        id: "49",
        name: "Mozzarella Fingers",
        description: "Breaded and fried sticks of mozzarella cheese.",
        price: "1.7 OMR",
        category: "Burger & Sandwiches",
      ),
      MenuItemModel(
        id: "50",
        name: "Nuggets Cheeses Jalapeno",
        description: "Nuggets Cheeses Jalapeno.",
        price: "1.7 OMR",
        category: "Burger & Sandwiches",
      ),
      MenuItemModel(
        id: "51",
        name: "Buffalo Chicken",
        description: "Chicken coated in a spicy sauce made from cayenne pepper, vinegar, and butter.",
        price: "1.7 OMR",
        category: "Burger & Sandwiches",
      ),
      MenuItemModel(
        id: "52",
        name: "Onion Rings",
        description: "Made with fresh onions, coated in a crispy batter.",
        price: "1 OMR",
        category: "Burger & Sandwiches",
      ),
      MenuItemModel(
        id: "53",
        name: "Super Fries",
        description: "Super Fries.",
        price: "1.7 OMR",
        category: "Burger & Sandwiches",
      ),
      MenuItemModel(
        id: "54",
        name: "Cheese Wedges",
        description: "Cheese, Breadcrumbs, Eggs, Milk.",
        price: "1 OMR",
        category: "Burger & Sandwiches",
      ),
    ];

    final List<MenuItemModel> nafhatBurgerJuiceItems = [
      MenuItemModel(
        id: "55",
        name: "Rob Pomegranate Juice",
        description: "Juice made from pomegranate.",
        price: "1.2 OMR",
        category: "Juices",
      ),
      MenuItemModel(
        id: "56",
        name: "Milk Shake Strawberry",
        description: "Fresh strawberries, milk, and vanilla ice cream.",
        price: "1.2 OMR",
        category: "Juices",
      ),
      MenuItemModel(
        id: "57",
        name: "Milkshake Mango",
        description: "Milkshake made with mango slices.",
        price: "1.2 OMR",
        category: "Juices",
      ),
      MenuItemModel(
        id: "58",
        name: "Milkshake Nutella",
        description: "Milkshake made with Nutella Chocolate spread.",
        price: "1.2 OMR",
        category: "Juices",
      ),
      MenuItemModel(
        id: "59",
        name: "Milkshake Oreo",
        description: "Creamy milkshake with Oreo cookies.",
        price: "1.2 OMR",
        category: "Juices",
      ),
      MenuItemModel(
        id: "60",
        name: "Milkshake Lotus",
        description: "Milkshake made with Lotus Biscoff and spread.",
        price: "1.2 OMR",
        category: "Juices",
      ),
    ];

    final List<MenuItemModel> nafhatBurgerMojitoItems = [
      MenuItemModel(
        id: "61",
        name: "Milkshake Cerelac",
        description: "Ice cream, milk, Cerelac powder.",
        price: "1.2 OMR",
        category: "Mojitos",
      ),
      MenuItemModel(
        id: "62",
        name: "Pomegranate Mojito",
        description: "Refreshing combination of juicy pomegranate and zesty lime, mixed with mint and rum.",
        price: "1 OMR",
        category: "Mojitos",
      ),
      MenuItemModel(
        id: "63",
        name: "Orange Mojito",
        description: "A refreshing citrus drink with mint.",
        price: "1 OMR",
        category: "Mojitos",
      ),
      MenuItemModel(
        id: "64",
        name: "Vimto Mojito",
        description: "Fruity cocktail with vimto flavor.",
        price: "1 OMR",
        category: "Mojitos",
      ),
      MenuItemModel(
        id: "65",
        name: "Strawberry Mojito",
        description: "Made with fresh strawberries, mint, lime juice, and soda.",
        price: "1 OMR",
        category: "Mojitos",
      ),
      MenuItemModel(
        id: "66",
        name: "Blue Sky Mojito",
        description: "Vibrant cocktail with rum, lime, mint, and blue curaçao.",
        price: "1 OMR",
        category: "Mojitos",
      ),
    ];

    final RestaurantsModel nafhatBurger = RestaurantsModel(
      id: "4",
      name: "Nafhat Burger",
      address: "Location B",
      email: "nafhatburger@example.com",
      website: "www.nafhatburger.om",
      phoneNumber: "456-4567890",
      menusList: [
        RestaurantMenuModel(
          id: "1",
          menuName: "Burger and Sandwiches",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: nafhatBurgerBurgerItems,
        ),
        RestaurantMenuModel(
          id: "2",
          menuName: "Juices",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: nafhatBurgerJuiceItems,
        ),
        RestaurantMenuModel(
          id: "3",
          menuName: "Mojitos",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: nafhatBurgerMojitoItems,
        ),
      ],
    );

    final List<MenuItemModel> baitAlMadkhoutMadghutunaItems = [
      MenuItemModel(
        id: "67",
        name: "Nafar Fresh Madghout Hashi With Rice",
        description: "Hashi meat pressure-cooked with hump fat.",
        price: "3.55 OMR",
        category: "madghutuna",
      ),
      MenuItemModel(
        id: "68",
        name: "Half Fresh Pressed Chicken With Rice",
        description: "The chicken is cooked with rice and madghout spices.",
        price: "2.2 OMR",
        category: "madghutuna",
      ),
    ];

    final List<MenuItemModel> baitAlMadkhoutMeatItems = [
      MenuItemModel(
        id: "69",
        name: "Adani Nafar Zurbian Fresh Lamb Meat",
        description: "Adani zurbian cooked with fresh lamb.",
        price: "4.6 OMR",
        category: "meat",
      ),
      MenuItemModel(
        id: "70",
        name: "Hashi Nafar Moqalqal",
        description: "Served With Bashawar rice.",
        price: "3.55 OMR",
        category: "meat",
      ),
      MenuItemModel(
        id: "71",
        name: "Muqlqal Hashi",
        description: "Served with bukhari rice.",
        price: "3.55 OMR",
        category: "meat",
      ),
    ];

    final List<MenuItemModel> baitAlMadkhoutChickenItems = [
      MenuItemModel(
        id: "72",
        name: "Half Fresh Grilled Chicken",
        description: "Served With Peshawar Rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
      MenuItemModel(
        id: "73",
        name: "Half Fresh Grilled Chicken",
        description: "Served With Bukhari Rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
      MenuItemModel(
        id: "74",
        name: "Half Fresh Grilled Chicken",
        description: "Served With Zurbian Rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
      MenuItemModel(
        id: "75",
        name: "Half Fresh Grilled Chicken",
        description: "Served With Hadrami Rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
      MenuItemModel(
        id: "76",
        name: "Half Fresh Charcoal Chicken",
        description: "Served With Bashawar rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
      MenuItemModel(
        id: "77",
        name: "Half Charcoal Chicken",
        description: "Half chicken served with rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
      MenuItemModel(
        id: "78",
        name: "Half Fresh Charcoal Chicken",
        description: "Served With Zurbian Rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
      MenuItemModel(
        id: "79",
        name: "Half Fresh Charcoal Chicken",
        description: "Served With Bukhari Rice.",
        price: "2.2 OMR",
        category: "chicken",
      ),
    ];

    final List<MenuItemModel> baitAlMadkhoutRiceItems = [
      MenuItemModel(
        id: "80",
        name: "Bashawer Rice",
        description: "For 1 person.",
        price: "0.7 OMR",
        category: "Rice",
      ),
      MenuItemModel(
        id: "81",
        name: "Bukhari Rice",
        description: "For 1 person.",
        price: "0.7 OMR",
        category: "Rice",
      ),
      MenuItemModel(
        id: "82",
        name: "Hadrami Rice",
        description: "For 1 person.",
        price: "0.7 OMR",
        category: "Rice",
      ),
    ];

    final List<MenuItemModel> baitAlMadkhoutDessertItems = [
      MenuItemModel(
        id: "83",
        name: "Cheese Konafa",
        description: "A Middle Eastern dessert made with shredded pastry and filled with cheese.",
        price: "1.1 OMR",
        category: "Desserts",
      ),
      MenuItemModel(
        id: "84",
        name: "Areeka Malaki",
        description: "With cream, honey, and a sprinkle of almonds and cashews.",
        price: "1.1 OMR",
        category: "Desserts",
      ),
    ];

    final RestaurantsModel baitAlMadkhout = RestaurantsModel(
      id: "5",
      name: "Bait Al Madkhout",
      address: "Location C",
      email: "baitalmadkhout@example.com",
      website: "www.baitalmadkhout.om",
      phoneNumber: "789-7890123",
      menusList: [
        RestaurantMenuModel(
          id: "1",
          menuName: "Madghutuna",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baitAlMadkhoutMadghutunaItems,
        ),
        RestaurantMenuModel(
          id: "2",
          menuName: "Meat",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baitAlMadkhoutMeatItems,
        ),
        RestaurantMenuModel(
          id: "3",
          menuName: "Chicken",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baitAlMadkhoutChickenItems,
        ),
        RestaurantMenuModel(
          id: "4",
          menuName: "Rice",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baitAlMadkhoutRiceItems,
        ),
        RestaurantMenuModel(
          id: "5",
          menuName: "Desserts",
          startDate: DateTime.now().toString(),
          endDate: DateTime.now().add(Duration(days: 365)).toString(),
          menuItems: baitAlMadkhoutDessertItems,
        ),
      ],
    );

    Future<void> upsertRestaurant(RestaurantsModel restaurant) async {
      final QuerySnapshot existingRestaurants = await restaurantsCollection
          .where('name', isEqualTo: restaurant.name)
          .get();

      if (existingRestaurants.docs.isEmpty) {
        await restaurantsCollection.add(restaurant.toJson());
      } else {
        final String existingRestaurantId = existingRestaurants.docs.first.id;
        await restaurantsCollection.doc(existingRestaurantId).update(restaurant.toJson());
      }
    }

    try {
      await upsertRestaurant(baithAlShay);
      await upsertRestaurant(nafhatBurger);
      await upsertRestaurant(baitAlMadkhout);
    } catch (e) {
      showToast(message: "Error upserting restaurants: $e");
      print("Error upserting restaurants: $e");
    }
  }
}

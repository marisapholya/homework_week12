import 'package:flutter/material.dart';
import 'food_list_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;
  final screen = [
    FoodListPage(),
    Center(
      child: Text(
        'YOUR ORDER',
        style: TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/homeBG.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: screen[_selectedBottomNavIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown.shade300,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown.shade900,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}

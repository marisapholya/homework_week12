import 'package:flutter/material.dart';
import 'package:homework_week12/pages/food/food_detail.dart';
import 'package:homework_week12/pages/home/home_page.dart';
import 'package:homework_week12/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'ChakraPetch',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
          headline2: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
          headline5: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          headline6: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
      ),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
        FoodDetail.routeName :(context) => const FoodDetail(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}

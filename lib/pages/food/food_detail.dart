import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework_week12/models/food_item.dart';

class FoodDetail extends StatefulWidget {
  static const routeName = '/fooddetail';

  const FoodDetail({Key? key}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    var detail = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          detail.name,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/detailBG.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'ชื่อเมนู : ${detail.name}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Image.asset(
                'assets/images/${detail.image}',
                width: 70.0,
                height: 240.0,
              ),
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: Text(
                  'ราคา: ${detail.price}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

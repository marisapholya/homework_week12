import 'package:flutter/material.dart';
import 'package:homework_week12/models/food_item.dart';
import 'package:homework_week12/pages/food/food_detail.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var items = [
    FoodItem(id: 1, name: "ข้าวผัด", price: 25, image: 'kao_pad.jpg'),
    FoodItem(id: 2, name: "ข้าวไข่เจียว", price: 25, image: 'kao_kai_jeaw.jpg'),
    FoodItem(id: 3, name: "ข้าวหมูแดง", price: 40, image: 'kao_moo_dang.jpg'),
    FoodItem(id: 4, name: "ข้าวมันไก่", price: 50, image: 'kao_mun_kai.jpg'),
    FoodItem(id: 5, name: "ข้าวหน้าเป็ด", price: 50, image: 'kao_na_ped.jpg'),
    FoodItem(id: 6, name: "ผัดไท", price: 40, image: 'pad_thai.jpg'),
    FoodItem(id: 7, name: "ผัดซีอิ๊ว", price: 40, image: 'pad_sie_eew.jpg'),
    FoodItem(id: 8, name: "ราดหน้า", price: 40, image: 'rad_na.jpg'),
    FoodItem(
        id: 9, name: "ส้มตำ-ไก่ย่าง", price: 80, image: 'som_tum_kai_yang.jpg'),
    FoodItem(id: 10, name: "สเต็ก", price: 85, image: 'food.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              highlightColor: Colors.brown.shade400.withOpacity(0.5),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  FoodDetail.routeName,
                  arguments: FoodItem(
                      id: item.id,
                      name: item.name,
                      price: item.price,
                      image: item.image),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/${item.image}',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            item.name,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            '${item.price} บาท',
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/profileBG.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown.shade300,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    child: Image.asset('assets/images/me.jpg'),
                  ),
                ),
              ),
              Text(
                'Marisa Pholya',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'pholya_m@silpakorn.edu',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

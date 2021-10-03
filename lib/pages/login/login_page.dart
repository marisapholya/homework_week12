import 'package:flutter/material.dart';
import 'package:homework_week12/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  var indexInput = 0;
  var pin = '123456';

  void _handleClickButton(int num) {
    setState(() {
      if (num == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else {
        input = '$input$num';
        if (input.length == 6) {
          if (input == pin) {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          } else {
            _showMaterialDialog(
              'ERROR!',
              'Invalid PIN. Please Try Again',
            );
            input = '';
          }
        }
      }
    });
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/loginBG.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Expanded ขยายให้เต็มพื้นที่ที่มีอยู่ ส่วนของด้านบน
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 180.0,
                        child: Image.asset('assets/images/lock2.png'),
                      ),
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'ENTER PIN TO LOGIN',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      // pin code
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0; i < 6; i++)
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Pass(
                                    width: 60,
                                    index: i,
                                    indexInput: indexInput,
                                    code: input,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ปุ่มตัวเลข
              Container(
                height: 420.0,
                child: Column(
                  children: [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pass extends StatelessWidget {
  final int indexInput;
  final int index;
  final String code;
  final double width;

  const Pass({
    required this.indexInput,
    required this.index,
    required this.code,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: code.length > index
                    ? Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade200,
                          shape: BoxShape.circle,
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2
          ? null
          : () {
              onClick(number);
            },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.brown,
                  width: 3.0,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Colors.blueGrey,
                    offset: Offset(1, 3),
                  )
                ],
              ),
        child: Center(
          child: number >= 0
              ? Text(
                  '$number',
                  style: Theme.of(context).textTheme.headline6,
                )
              : (number == -1
                  ? Icon(
                      Icons.backspace_outlined,
                      size: 30.0,
                      color: Colors.red.shade400,
                    )
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}

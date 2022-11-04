import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Account_Screen.dart';
import 'package:shoppingapp/Screens/Cart_Screen.dart';
import 'package:shoppingapp/Screens/Help_Screen.dart';
import 'package:shoppingapp/Screens/Home_screen.dart';
import 'package:shoppingapp/Screens/Item_Details.dart';
import 'package:shoppingapp/Screens/Items_Screen.dart';
import 'package:shoppingapp/Screens/Login_Screen.dart';
import 'package:shoppingapp/Screens/Setting_Screen.dart';
import 'package:shoppingapp/Screens/Signup_Screen.dart';
import 'package:shoppingapp/Screens/orderhistory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white30,
        ),
        home: MyHome(
          title: 'Groceries',
        ));
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHome> createState() => _Homestate();
}

class _Homestate extends State<MyHome> {
  startTime() {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navgationpage);
  }

  void navgationpage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
          //color: Colors.black12,
          margin: EdgeInsets.all(30.0),
          height: 250.0,
          width: 250.0,
          child: Image.asset('assets/logo1.png')),
    );
  }
}

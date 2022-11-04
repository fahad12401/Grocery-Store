import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Cart_Screen.dart';
import 'package:shoppingapp/Screens/Checkout_Screen.dart';

class DetailsofItems extends StatefulWidget {
  const DetailsofItems({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Itemdetails();
}

class _Itemdetails extends State<DetailsofItems> {
  int _currentindex = 0;
  final List<String> imagelist = [
    'assets/banaspati.jpg',
    'assets/ghee.jpg',
    'assets/habiboil.jpg',
    'assets/everyday.jpg',
    'assets/pickle.jpg',
  ];
  String toolbarname = 'Grocery Items';
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  List list = ['12', '13'];
  String itemname = 'Habib Oil';
  String itemprice = 'Rs.500';
  int item = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle textStyle =
        theme.textTheme.headline2!.copyWith(color: Colors.white);
    final TextStyle descriptionstyle = theme.textTheme.subtitle1!;
    IconData _backicon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }

      return null!;
    }

    IconData _addicon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }

      return null!;
    }

    IconData _subicon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }

      return null!;
    }

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              _backicon(),
              color: Colors.black,
            ),
            tooltip: 'Back',
            alignment: Alignment.centerLeft,
          ),
          title: Text(
            toolbarname,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 150.0,
                width: 30.0,
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout()));
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                      list.length == 0
                          ? Container()
                          : Positioned(
                              child: Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.brightness_1,
                                  color: Colors.blue,
                                  size: 20.0,
                                ),
                                Positioned(
                                    top: 4.0,
                                    right: 5.5,
                                    child: Center(
                                      child: Text(
                                        list.length.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                              ],
                            ))
                    ],
                  ),
                ),
              ),
            )
          ]),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Card(
              elevation: 4.0,
              child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 250,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Container(
                              child: CarouselSlider(items: [
                                Image.asset(
                                  'assets/ghee.jpg',
                                  fit: BoxFit.scaleDown,
                                ),
                                Image.asset(
                                  'assets/habiboil.jpg',
                                  fit: BoxFit.scaleDown,
                                ),
                                Image.asset(
                                  'assets/banaspati.jpg',
                                  fit: BoxFit.scaleDown,
                                ),
                                Image.asset(
                                  'assets/everyday.jpg',
                                  fit: BoxFit.scaleDown,
                                ),
                                Image.asset(
                                  'assets/pickle.jpg',
                                  fit: BoxFit.scaleDown,
                                ),
                                Image.asset(
                                  'assets/sauses.jpg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ], options: CarouselOptions()),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: DefaultTextStyle(
                  style: descriptionstyle,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          itemname,
                          style: descriptionstyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          itemprice,
                          style: descriptionstyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: DefaultTextStyle(
                      style: descriptionstyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(children: <Widget>[
                            IconButton(
                                onPressed: () {
                                  item = item + 1;
                                },
                                icon: Icon(
                                  _addicon(),
                                  color: Colors.black,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 2.0),
                            ),
                            Text(
                              item.toString(),
                              style: descriptionstyle.copyWith(
                                  fontSize: 20, color: Colors.black),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 2.0),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (item < 0) {
                                  } else {
                                    item = item - 1;
                                  }
                                },
                                icon: Icon(
                                  _subicon(),
                                  color: Colors.black,
                                )),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                            side: BorderSide(
                                                color: Colors.blue)))),
                                child: const Text('Add'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart_Screen()));
                                },
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: DefaultTextStyle(
                  style: descriptionstyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Details',
                          style: descriptionstyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Text(
                  "Grocery stores also offer non-perishable foods that are packaged in bottles, boxes, and cans; some also have bakeries, butchers, delis, and fresh produce. Large grocery stores that stock significant amounts of non-food products, such as clothing and household items, are called supermarkets. Some large supermarkets also include a pharmacy, and customer service, redemption, and electronics sections.",
                  maxLines: 10,
                  style: TextStyle(fontSize: 13.0, color: Colors.black38),
                ))
          ],
        )),
      ),
    );
  }
}

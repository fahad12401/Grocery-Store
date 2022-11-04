import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoppingapp/Screens/Cart_Screen.dart';
import 'package:shoppingapp/Screens/Payment_Screen.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => check_out();
}

class Item {
  final String itemname;
  final String itemquantity;
  final String itemprice;
  Item(
      {required this.itemname,
      required this.itemprice,
      required this.itemquantity});
}

class check_out extends State<Checkout> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool checkboxvalueA = true;
  bool checkboxvalueB = false;
  bool checkboxvalueC = false;
  IconData _backicon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back;
    }
    assert(false);
    return null!;
  }

  List<Item> itemlist = <Item>[
    Item(itemname: 'Habib Oil', itemprice: 'Rs.500', itemquantity: 'Qty: 20kg'),
    Item(
        itemname: 'Habib Banaspati',
        itemprice: 'Rs.550',
        itemquantity: 'Qty: 20kg'),
    Item(
        itemname: 'Banaspati Rice',
        itemprice: 'Rs.350',
        itemquantity: 'Qty: 50kg'),
    Item(itemname: 'Sugar', itemprice: 'Rs.150 ', itemquantity: 'Qty: 50kg'),
    Item(
        itemname: 'EveryDay Milk',
        itemprice: 'Rs.500',
        itemquantity: 'Qty: 40'),
    Item(itemname: 'Hub Salt', itemprice: 'Rs.70', itemquantity: 'Qty: 50 '),
    Item(
        itemname: 'Sunridge Flour',
        itemprice: 'Rs.550',
        itemquantity: 'Qty: 50'),
    Item(
        itemname: 'National Ketchup',
        itemprice: 'Rs.190',
        itemquantity: 'Qty: 40'),
    Item(
        itemname: 'National Mixed pickle',
        itemprice: 'Rs.400',
        itemquantity: 'Qty: 20'),
    Item(
        itemname: 'National sause Pack',
        itemprice: 'Rs.400',
        itemquantity: 'Qty: 20'),
  ];
  String toolbarname = 'CheckOut';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    AppBar appBar = AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          _backicon(),
          color: Colors.black,
        ),
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
      ),
      title: Text(
        toolbarname,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Cart_Screen()));
              },
            ),
          ),
        )
      ],
    );
    return Scaffold(
      key: _scaffoldkey,
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Delivery',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.blue,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Payment',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.check_circle,
                                        color: Colors.black38,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, right: 0.0, bottom: 5.0, top: 5.0),
            child: Text('Delivery Address.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
              height: 165.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 165.0,
                    width: 56.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey)),
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: null,
                              icon: Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 165.0,
                    width: 200.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey)),
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 12.0, right: 0.0, top: 5.0, bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Hashim waqas',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'street 2, Defence',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'Ketchup',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  'MD 21801',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 0.0,
                                    right: 0.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Delivery Address.',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        _verticalD(),
                                        Checkbox(
                                            value: checkboxvalueA,
                                            onChanged: (bool? value) {
                                              checkboxvalueA = value!;
                                            })
                                      ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 165.0,
                    width: 200.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey)),
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 12.0, right: 0.0, top: 5.0, bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Hashim waqas',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'street 4,phase 8, Defence',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'Habib Oil',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  'AS 12341',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 0.0,
                                    right: 0.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Delivery Address.',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        _verticalD(),
                                        Checkbox(
                                            value: checkboxvalueB,
                                            onChanged: (bool? value) {
                                              checkboxvalueB = value!;
                                            })
                                      ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 165.0,
                    width: 200.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey)),
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 12.0, right: 0.0, top: 5.0, bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Uzma Furqan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'Nazimabad, 33b',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  'Sunridge Flour',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  'FF 67627',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 0.0,
                                    right: 0.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Delivery Address.',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        _verticalD(),
                                        Checkbox(
                                            value: checkboxvalueC,
                                            onChanged: (bool? value) {
                                              checkboxvalueC = value!;
                                            })
                                      ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Divider(
            height: 5,
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                  left: 12.0, right: 0.0, top: 5.0, bottom: 5.0),
              child: Text(
                'Order Summary',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              )),
          Container(
              margin: EdgeInsets.only(
                  left: 12.0, right: 12.0, bottom: 5.0, top: 5.0),
              height: 170.0,
              child: ListView.builder(
                  itemCount: itemlist.length,
                  itemBuilder: (BuildContext cont, int ind) {
                    return SafeArea(
                        child: Column(
                      children: <Widget>[
                        Divider(
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(itemlist[ind].itemname,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text(itemlist[ind].itemquantity,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text(itemlist[ind].itemprice,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ));
                  })),
          Spacer(),
          Container(
            alignment: Alignment.bottomLeft,
            height: 50.0,
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.info),
                  ),
                  Text('Total :',
                      style: TextStyle(fontSize: 17.0, color: Colors.black)),
                  Text(
                    'Rs.15000',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.blueAccent,
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment()));
                        },
                        child: const Text(
                          'CONFIRM ORDER',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  IconData _addicon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.add;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null!;
  }

  IconData _subicon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.remove;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null!;
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}

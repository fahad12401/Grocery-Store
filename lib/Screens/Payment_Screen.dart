import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Item_Details.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Payment();
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

class _Payment extends State<Payment> {
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

  int radiovalue = 0;
  void handleRadiovaluechange(int? value) {
    setState(() {
      radiovalue = value!;
    });
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
              onTap: () {},
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
                                        color: Colors.black38),
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.black38,
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
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.check_circle,
                                        color: Colors.blue,
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
          //Divider(),
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              child: Container(
                color: Color.fromARGB(255, 143, 224, 174),
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                child: Text(
                  "GET EXTRA 5% OFF* with MONEY bank Simply Save Credit card. T&C.",
                  maxLines: 10,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 12.0, right: 0.0, bottom: 5.0, top: 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              'Payment Method',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Container(
            height: 264.0,
            margin: EdgeInsets.all(10.0),
            child: Card(
              child: Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Wallet / UPI',
                              maxLines: 10,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                            Radio<int>(
                                value: 0, groupValue: 0, onChanged: null),
                          ],
                        ),
                      ),
                      Divider(),
                      _verticalD(),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Net Banking',
                              maxLines: 10,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                            Radio<int>(
                                value: 0, groupValue: 0, onChanged: null),
                          ],
                        ),
                      ),
                      Divider(),
                      _verticalD(),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Credit / Debit / ATM Card',
                              maxLines: 10,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                            Radio<int>(
                                value: 0, groupValue: 0, onChanged: null),
                          ],
                        ),
                      ),
                      Divider(),
                      _verticalD(),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Cash on Delivery',
                              maxLines: 10,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                            Radio<int>(
                                value: 0,
                                groupValue: 0,
                                onChanged: handleRadiovaluechange),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.bottomLeft,
            height: 50.0,
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(onPressed: null, icon: Icon(Icons.info)),
                  Text(
                    'Total : ',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rs.15000',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
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
                                      builder: (context) => DetailsofItems()));
                            },
                            child: const Text('PROCEED TO PAY')),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}

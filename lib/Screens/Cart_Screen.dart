import 'package:flutter/material.dart';

import 'Checkout_Screen.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Cart();
}

class item {
  final String itemImage;
  final String itemName;
  final String itemquantity;
  final String itemprice;
  item(
      {required this.itemImage,
      required this.itemName,
      required this.itemprice,
      required this.itemquantity});
}

class Cart extends State<Cart_Screen> {
  List<item> itemlist = <item>[
    item(
        itemImage: 'assets/habiboil.jpg',
        itemName: 'Habib Oil',
        itemprice: 'Rs.500',
        itemquantity: 'Qty: 20kg'),
    item(
        itemImage: 'assets/ghee.jpg',
        itemName: 'Habib Banaspati',
        itemprice: 'Rs.550',
        itemquantity: 'Qty: 20kg'),
    item(
        itemImage: 'assets/banaspati.jpg',
        itemName: 'Banaspati Rice',
        itemprice: 'Rs.350 ',
        itemquantity: 'Qty: 50kg'),
    item(
        itemImage: 'assets/sugar.jpg',
        itemName: 'Sugar',
        itemprice: 'Rs.150',
        itemquantity: 'Qty: 50kg'),
    item(
        itemImage: 'assets/everyday.jpg',
        itemName: 'EveryDay Milk',
        itemprice: 'Rs.500',
        itemquantity: 'Qty: 50'),
    item(
        itemImage: 'assets/hubsalt.jpg',
        itemName: 'Hub Salt',
        itemprice: 'Rs.70',
        itemquantity: 'Qty: 50'),
    item(
        itemImage: 'assets/sunridge.jpg',
        itemName: 'Sunridge Flour',
        itemprice: 'Rs.550',
        itemquantity: 'Qty: 50'),
    item(
        itemImage: 'assets/ketchup.jpg',
        itemName: 'National Ketchup',
        itemprice: 'Rs.190',
        itemquantity: 'Qty: 40'),
    item(
        itemImage: 'assets/pickle.jpg',
        itemName: 'National Mixed pickle',
        itemprice: 'Rs.400',
        itemquantity: 'Qty: 20'),
    item(
        itemImage: 'assets/sauses.jpg',
        itemName: 'National sause Pack',
        itemprice: 'Rs.400',
        itemquantity: 'Qty: 20'),
  ];
  String toolbarname = 'My Cart (4)';
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  IconData _backicon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null!;
  }

  late String pincode;

  @override
  Widget build(BuildContext context) {
    IconData _addicon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      assert(false);
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
      assert(false);
      return null!;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double ww = width * 0.77;
    double hh = height - 215.0;
    int item = 0;
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextstyle = theme.textTheme.subtitle1!
        .copyWith(color: theme.textTheme.caption!.color);

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(toolbarname),
        backgroundColor: Colors.white24,
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ItemScreen()));
                        },
                        icon: Icon(Icons.home, color: Colors.amber))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Pncode :',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 2.0),
                              ),
                              GestureDetector(
                                child: Text(
                                  '665658',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                ),
                                onTap: () {
                                  showdemodialog<DialogDemoAction>(
                                      context: context,
                                      child: AlertDialog(
                                        title:
                                            const Text('Location/Area Pincode'),
                                        content: SizedBox(
                                          height: 24.0,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              hintText: '*******',
                                              labelText: 'Pincode',
                                            ),
                                            onSaved: (String? value) {
                                              this.pincode = value!;
                                            },
                                          ),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    DialogDemoAction.disagree);
                                              },
                                              child: const Text('CANCEL')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context,
                                                    DialogDemoAction.agree);
                                              },
                                              child: const Text('SAVE')),
                                        ],
                                      ));
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 5.0, bottom: 10.0),
              height: hh,
              child: ListView.builder(
                itemCount: itemlist.length,
                itemBuilder: (BuildContext cont, int ind) {
                  return SafeArea(
                      child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 120.0,
                                width: ww,
                                child: Card(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 110.0,
                                        width: 100.0,
                                        child: Image.asset(
                                          itemlist[ind].itemImage,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 120.0,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              _verticalID(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  // TextButton(
                                                  //   Text(itemlist[ind].itemName,
                                                  //   style: TextStyle(
                                                  //       fontWeight:
                                                  //           FontWeight.bold,
                                                  //       fontSize: 18.0,
                                                  //       color: Colors.black),
                                                  //   )
                                                  //   onPressed: () {},)
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        itemlist[ind].itemName,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18.0,
                                                            color:
                                                                Colors.black),
                                                      ))
                                                ],
                                              ),
                                              _verticalID(),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    itemlist[ind].itemprice,
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(_addicon()),
                                                    color: Colors.amber,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 2.0),
                                                  ),
                                                  Text(item.toString()),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 2.0),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(_subicon()),
                                                    color: Colors.amber,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 110.0,
                                width: 50.0,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text(itemlist[ind].itemprice)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              height: 60.0,
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(onPressed: null, icon: Icon(Icons.info)),
                    Text(
                      'Total :',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rs.3000',
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
                            side: BorderSide(color: Colors.amber),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Checkout()));
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
      ),
    );
  }

  void showdemodialog<T>({required BuildContext context, Widget? child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child!,
    ).then<void>((value) {
      if (value != null) {
        _scaffoldkey.currentState!
            .showSnackBar(SnackBar(content: Text('You selected: $value')));
      }
    });
  }

  _verticalID() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 07.0, bottom: 0.0),
      );
}

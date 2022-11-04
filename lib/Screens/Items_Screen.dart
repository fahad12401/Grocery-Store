import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/Models/Address_Model.dart';
import 'package:shoppingapp/Screens/Cart_Screen.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart' as rangeSlider;

class ScreenofItem extends StatefulWidget {
  final String toolbarname;
  const ScreenofItem({Key? key, required this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Itemscreen(toolbarname);
}

class Dataofitem {
  final String itemname;
  final String imagename;
  final String itemprice;
  Dataofitem(
      {required this.imagename,
      required this.itemname,
      required this.itemprice});
}

class _Itemscreen extends State<ScreenofItem> {
  String toolbarname;
  _Itemscreen(this.toolbarname);
  List list = ['12', '13'];
  bool checkboxvalueA = true;
  bool checkboxvalueB = false;
  bool checkboxvalueC = false;
  late VoidCallback _showbottomsheetcallback;
  List<Dataofitem> itemlist = <Dataofitem>[
    Dataofitem(
      imagename: 'assets/habiboil.jpg',
      itemname: 'Habib Oil',
      itemprice: 'Rs.500',
    ),
    Dataofitem(
      imagename: 'assets/ghee.jpg',
      itemname: 'Habib Banaspati',
      itemprice: 'Rs.550',
    ),
    Dataofitem(
      imagename: 'assets/banaspati.jpg',
      itemname: 'Banaspati Rice',
      itemprice: 'Rs.350 ',
    ),
    Dataofitem(
      imagename: 'assets/sugar.jpg',
      itemname: 'Sugar',
      itemprice: 'Rs.150',
    ),
    Dataofitem(
      imagename: 'assets/everyday.jpg',
      itemname: 'EveryDay',
      itemprice: 'Rs.500',
    ),
    Dataofitem(
      imagename: 'assets/hubsalt.jpg',
      itemname: 'Hub Salt',
      itemprice: 'Rs.70',
    ),
    Dataofitem(
      imagename: 'assets/sunridge.jpg',
      itemname: 'Sunridge',
      itemprice: 'Rs.550',
    ),
    Dataofitem(
      imagename: 'assets/ketchup.jpg',
      itemname: 'N-Ketchup',
      itemprice: 'Rs.190',
    ),
    Dataofitem(
      imagename: 'assets/pickle.jpg',
      itemname: 'Mixed pickle',
      itemprice: 'Rs.400',
    ),
    Dataofitem(
      imagename: 'assets/sauses.jpg',
      itemname: 'sause Pack',
      itemprice: 'Rs.400',
    )
  ];
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    IconData _backicon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.fuchsia:
        case TargetPlatform.android:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      return null!;
    }

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            _backicon(),
            color: Colors.black,
          ),
          alignment: Alignment.centerLeft,
          tooltip: 'Search',
          onPressed: () async {
            final int selected =
                await showSearch(context: context, delegate: null!);
          },
        ),
        title: Text(
          toolbarname,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              tooltip: 'Sort',
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                _showbottomsheet;
              }),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 150,
              width: 30,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart_Screen()));
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        )),
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
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  )))
                            ],
                          ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(4.0),
              children: itemlist.map((Dataofitem photo) {
                return TravelDestinationItem(
                  destination: photo,
                  shape: RoundedRectangleBorder(),
                );
              }).toList(),
            )),
          )
        ],
      ),
    );
  }

  _veticalID() => Container(
        margin: EdgeInsets.only(left: 10),
      );
  bool a = true;
  String mText = 'Press to Hide';
  double _lowerValue = 1.0;
  double _upperValue = 100.0;
  void _visibilitymethod() {
    setState(() {
      if (a) {
        a = false;
        mText = "Press to show";
      } else {
        a = true;
        mText = "Press to hide";
      }
    });
  }

  // List<RangeSliderData> rangeSliders;
  // List<Widget> _buildRangeSliders() {
  //   List<Widget> childern = <Widget>[];
  //   for (int index = 0; index < rangeSliders.length; index++) {
  //     childern
  //         .add(rangeSliders[index].build(context, (double lower, double upper) {
  //       setState(() {
  //         rangeSliders[index].lowerValue = lower;
  //         rangeSliders[index].upperValue = upper;
  //       });
  //     }));
  //     childern.add(SizedBox(
  //       height: 8.0,
  //     ));
  //   }
  //   return childern;
  // }

  void _showbottomsheet() {
    setState(() {
      //disable the button
      _showbottomsheetcallback = null!;
    });
    _scaffoldkey.currentState!
        .showBottomSheet<Null>((BuildContext context) {
          final ThemeData themeData = Theme.of(context);
          return Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: themeData.disabledColor))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                    Text(
                      'FILTER / SORTING',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    _veticalID(),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white)))),
                        onPressed: () {},
                        child: const Text(
                          'CLEAR',
                          style: TextStyle(color: Colors.white),
                        )),
                    _veticalID(),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white)))),
                        onPressed: () {},
                        child: const Text(
                          'APPLY',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sort',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                Container(
                  height: 115.0,
                  margin: EdgeInsets.only(left: 7.0, top: 5.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'LOWEST',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'PRICE',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          Text(
                                            'FIRST',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'HIGHEST',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          'PRICE',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'FIRST',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'POPULAR',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          'PRICE',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'FIRST',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'EST',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          'PRICE',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'FIRST',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'EST',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          'PRICE',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'FIRST',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Filter',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'PRICE',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'SELECT OFFER',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                    height: 80.0,
                    margin: EdgeInsets.only(left: 7.0, top: 5.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.pink.shade100,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.pink.shade100,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Buy More,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'Save More',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.indigo.shade500,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Special,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'Price',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.teal.shade200,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Item of,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'The Day',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 120.0,
                          child: Card(
                            color: Colors.yellow.shade100,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Buy 1,,',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'GET 1 FREE',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'DISCOUNT',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                    height: 90.0,
                    margin: EdgeInsets.only(left: 7.0, top: 5.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 80.0,
                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '10%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '20%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '30%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          child: Card(
                            color: Colors.white,
                            elevation: 3.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '40%',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Text(
                                            'OR LESS',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'AVAILIBILITY',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                    child: Align(
                        alignment: const Alignment(0.0, -0.2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Radio<int>(
                                value: 0,
                                groupValue: radioValue,
                                onChanged: handleRadioValueChanged),
                            Text(
                              'Available for this location',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))),
              ],
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showbottomsheetcallback = _showbottomsheet;
            });
          }
        });
  }

  int radioValue = 0;
  bool switchValue = false;
  void handleRadioValueChanged(int? value) {
    setState(() {
      radioValue = value!;
    });
  }
}

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem(
      {Key? key, required this.destination, required this.shape})
      : assert(destination != null),
        super(key: key);
  static const double height = 566.0;
  final Dataofitem destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    // final TextStyle titleStyle =
    //     theme.textTheme.headline1!.copyWith(color: Colors.white);
    // final TextStyle descriptionStyle =
    //     theme.textTheme.subtitle1!.copyWith(color: Colors.white);

    return SafeArea(
        top: false,
        bottom: false,
        child: Container(
          padding: EdgeInsets.all(4.0),
          height: height,
          child: GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => Item_Details()));
            },
            child: Card(
              shape: shape,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Image.asset(
                          destination.imagename,
                          fit: BoxFit.scaleDown,
                        )),
                        Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: DefaultTextStyle(
                        style: TextStyle(color: Colors.black),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                destination.itemname,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                destination.itemprice,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        )),
                  )),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Colors.black)))),
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        //  Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Item_Details()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  List<RangeSliderData> _rangesliderDefinition() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 0,
          max: 100.0,
          lowerValue: 25.0,
          upperValue: 100.0,
          divisions: 0),
      RangeSliderData(
          min: 0,
          max: 100.0,
          lowerValue: 10,
          upperValue: 30,
          divisions: 20,
          overlayColor: Colors.red),
      RangeSliderData(
          min: 0,
          max: 100,
          lowerValue: 10,
          upperValue: 30,
          divisions: 0,
          showValueIndicator: true,
          valueIndicatorMaxDecimals: 0),
      RangeSliderData(
          min: 0,
          max: 100.0,
          lowerValue: 10,
          upperValue: 30,
          divisions: 0,
          showValueIndicator: true,
          activeTrackColor: Colors.red,
          valueIndicatorMaxDecimals: 0,
          inactiveTrackColor: Color.fromARGB(255, 173, 109, 105),
          valueIndicatorColor: Colors.green),
      RangeSliderData(
          min: 0,
          max: 100,
          lowerValue: 25,
          upperValue: 70,
          divisions: 20,
          thumbColor: Colors.grey,
          valueIndicatorColor: Colors.grey)
    ];
  }
}

class RangeSliderData {
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    required this.min,
    required this.max,
    required this.lowerValue,
    required this.upperValue,
    required this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  // Returns the values in text format, with the number
  // of decimals, limited to the valueIndicatedMaxDecimals
  //
  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);
  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  // Builds a RangeSlider and customizes the theme
  // based on parameters
  //
  Widget build(BuildContext context, callback) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(lowerValueText),
          ),
          Expanded(
            child: SliderTheme(
              // Customization of the SliderTheme
              // based on individual definitions
              // (see rangeSliders in _RangeSliderSampleState)
              data: SliderTheme.of(context).copyWith(
                overlayColor: overlayColor,
                activeTickMarkColor: activeTickMarkColor,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inactiveTrackColor,
                thumbColor: thumbColor,
                valueIndicatorColor: valueIndicatorColor,
                showValueIndicator: showValueIndicator
                    ? ShowValueIndicator.always
                    : ShowValueIndicator.onlyForDiscrete,
              ),
              child: rangeSlider.RangeSliderFlutter(
                min: 0,
                max: max,
                // lowerValue: lowerValue,
                // upperValue: upperValue,
                // divisions: divisions,
                // showValueIndicator: showValueIndicator,
                // valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                values: [lowerValue, upperValue],
                rangeSlider: true,
                tooltip: rangeSlider.RangeSliderFlutterTooltip(
                  alwaysShowTooltip: true,
                ),
                handlerHeight: 20000,
                textPositionTop: -100,
                textBackgroundColor: Colors.black,
                trackBar: rangeSlider.RangeSliderFlutterTrackBar(
                    activeTrackBarHeight: 10,
                    inactiveTrackBarHeight: 10,
                    activeTrackBar: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey)),
                fontSize: 15,
                handler: rangeSlider.RangeSliderFlutterHandler(
                    decoration: BoxDecoration(color: Colors.yellow)),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(upperValueText),
          ),
        ],
      ),
    );
  }
}

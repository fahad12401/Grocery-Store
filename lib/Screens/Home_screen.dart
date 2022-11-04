import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Account_Screen.dart';
import 'package:shoppingapp/Screens/Cart_Screen.dart';
import 'package:shoppingapp/Screens/Help_Screen.dart';
import 'package:shoppingapp/Screens/Login_Screen.dart';
import 'package:shoppingapp/Screens/Setting_Screen.dart';
import 'package:shoppingapp/Screens/orderhistory.dart';

import 'Items_Screen.dart';

const String _kGalleryAssetPackage = 'flutter_gallery_assets';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Home();
}

class Photo {
  final String assetName;
  //final String assetPkg;
  final String title;
  // final String caption;
  Photo(
      {required this.assetName,
      //  this.assetPkg,
      //  this.caption,
      required this.title});
}

class Home extends State<HomeScreen> {
  List list = ['11', '12'];
  List<Photo> photo = <Photo>[
    Photo(assetName: 'assets/habiboil.jpg', title: 'Habib Oil'),
    Photo(assetName: 'assets/banaspati.jpg', title: 'Banaspati Rice'),
    Photo(assetName: 'assets/hubsalt.jpg', title: 'Hubsalt'),
    Photo(assetName: 'assets/ketchup.jpg', title: 'National Ketchup'),
    Photo(assetName: 'assets/everyday.jpg', title: 'Everyday'),
    Photo(assetName: 'assets/pickle.jpg', title: 'National Pickle'),
    Photo(assetName: 'assets/sauses.jpg', title: 'National sauses'),
    Photo(assetName: 'assets/sugar.jpg', title: 'Sugar')
  ];
  final List<String> items = ['Gazi', 'farhad', 'Roshi'];
  static const double height = 360.0;
  String name = 'My Wishlist';
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);
    final TextStyle titlestyle =
        theme.textTheme.headline1!.copyWith(color: Colors.black54);
    final TextStyle descriptivestyle = theme.textTheme.subtitle1!;
    ShapeBorder shapeBorder;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Grocery Store",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () async {
              final int selected =
                  await showSearch(context: context, delegate: null!);
            },
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 250.0,
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
                                size: 20.0,
                                color: Colors.blueAccent,
                              ),
                              Positioned(
                                  top: 4.0,
                                  bottom: 5.5,
                                  child: Center(
                                    child: Text(
                                      list.length.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ))
                            ],
                          ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Card(
              child: UserAccountsDrawerHeader(
                accountName: Text('Fahad Ali Khan'),
                accountEmail: Text('fk6300244@gmail.com'),
                onDetailsPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Account_Screen()));
                },
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.difference,
                    color: Colors.white30),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/account.jpg'),
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text(name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScreenofItem(toolbarname: name)));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Order History',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => OrderHitory())));
                    },
                  )
                ],
              ),
            ),
            Card(
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SettingScreen(toolbarname: 'Settings')));
                    },
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Help',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Helpscreen(toolbarname: 'Help')));
                    },
                  )
                ],
              ),
            ),
            Card(
              elevation: 4.0,
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  'logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _verticalID(),
                GestureDetector(
                  child: Text(
                    'Best Value',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreenofItem(toolbarname: 'Grocery Items')));
                  },
                ),
                _verticalID(),
                GestureDetector(
                  child: Text(
                    'Top Sellers',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreenofItem(toolbarname: 'Grocery Items')));
                  },
                ),
                _verticalID(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'All',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black26),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenofItem(
                                    toolbarname: 'Grocery Items')));
                      },
                    ),
                    _verticalID(),
                    IconButton(
                      onPressed: () {},
                      icon: keyloch,
                      color: Colors.black26,
                    )
                  ],
                ),
              ],
            ),
            Container(
              height: 220.0,
              margin: EdgeInsets.only(left: 5.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 300.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26)),
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 200.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                        child: Image.asset(
                                      'assets/item1.jpg',
                                      fit: BoxFit.cover,
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 300.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26)),
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 200.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                        child: Image.asset(
                                      'assets/item2.jpg',
                                      fit: BoxFit.cover,
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 300.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26)),
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 200.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                        child: Image.asset(
                                      'assets/item3.jpg',
                                      fit: BoxFit.cover,
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  SafeArea(
                      top: true,
                      bottom: true,
                      child: Container(
                        width: 300.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26)),
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 200.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                        child: Image.asset(
                                      'assets/item4.jpg',
                                      fit: BoxFit.cover,
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 7.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _verticalID(),
                  GestureDetector(
                    child: Text(
                      'Catagories',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScreenofItem(toolbarname: 'Grocery Items')));
                    },
                  ),
                  _verticalID(),
                  GestureDetector(
                    child: Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScreenofItem(toolbarname: 'Grocery Items')));
                    },
                  ),
                  _verticalID(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          'Whats',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black26),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenofItem(
                                      toolbarname: 'Grocery Items')));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 700.0,
              child: GridView.builder(
                  itemCount: photo.length,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenofItem(
                                    toolbarname: 'Grocery Items')));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black38)),
                          elevation: 3.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 160.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                          child: Image.asset(
                                        photo[index].assetName,
                                        fit: BoxFit.cover,
                                      )),
                                      Container(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 3.0, bottom: 3.0),
                                        alignment: Alignment.bottomLeft,
                                        child: GestureDetector(
                                          child: Text(
                                            photo[index].title,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ScreenofItem(
                                                            toolbarname:
                                                                'Grocery Items')));
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Icon keyloch = Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  _verticalID() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 7.0, bottom: 0.0),
      );
}

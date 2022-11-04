import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Cart_Screen.dart';

class Helpscreen extends StatefulWidget {
  final String toolbarname;
  const Helpscreen({Key? key, required this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Help(toolbarname);
}

class Help extends State<Helpscreen> {
  List list = ['11', '12'];
  bool switchValue = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String toolbarname;
  Help(this.toolbarname);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogstyle = theme.textTheme.subtitle1!
        .copyWith(color: theme.textTheme.caption!.color);
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

    final Orientation orientation = MediaQuery.of(context).orientation;

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
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
        ),
        title: Text(
          toolbarname,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 7.0),
              child: Row(
                children: <Widget>[
                  _verticalID(),
                  GestureDetector(
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Card(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 15.0, bottom: 15.0),
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.mail,
                                color: Colors.black54,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                              ),
                              Text(
                                'Email us',
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            showDemodialog<DialogDemoAction>(
                                context: context,
                                child: AlertDialog(
                                  title: const Text('Email us'),
                                  content: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: dialogstyle),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context,
                                              DialogDemoAction.disagree);
                                        },
                                        child: const Text('Disagree'))
                                  ],
                                ));
                          },
                        ),
                      ),
                      Divider(
                        height: 7.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 15.0, bottom: 15.0),
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.info,
                                color: Colors.black54,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                              ),
                              Text(
                                'About us',
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            showDemodialog<DialogDemoAction>(
                                context: context,
                                child: AlertDialog(
                                  title: const Text('About us'),
                                  content: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: dialogstyle),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context,
                                              DialogDemoAction.disagree);
                                        },
                                        child: const Text('Disagree'))
                                  ],
                                ));
                          },
                        ),
                      ),
                      Divider(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 15.0, bottom: 15.0),
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.feedback,
                                color: Colors.black54,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                              ),
                              Text(
                                'Send Feedback',
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            showDemodialog<DialogDemoAction>(
                                context: context,
                                child: AlertDialog(
                                  title: const Text('Send Feedback'),
                                  content: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: dialogstyle),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context,
                                              DialogDemoAction.disagree);
                                        },
                                        child: const Text('Disagree'))
                                  ],
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDemodialog<T>({required BuildContext context, Widget? child}) {
    showDialog<T>(context: context, builder: (BuildContext context) => child!)
        .then<void>((value) {
      if (value != null) {
        _scaffoldkey.currentState!
            .showBottomSheet((context) => Text('You Selected $value'));
      }
    });
  }

  _verticalID() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 07.0, bottom: 0.0),
      );
}

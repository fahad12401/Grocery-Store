import 'package:flutter/material.dart';
import 'package:shoppingapp/Screens/Cart_Screen.dart';

class SettingScreen extends StatefulWidget {
  final String toolbarname;
  const SettingScreen({Key? key, required this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Setting(toolbarname);
}

class Setting extends State<SettingScreen> {
  List list = ['11', '12'];
  bool switchValue = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String toolbarname;
  Setting(this.toolbarname);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextstyle = theme.textTheme.subtitle1!
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
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
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
                    onTap: () {},
                    child: Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
                  padding:
                      EdgeInsets.only(left: 10, top: 6, bottom: 6, right: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            color: Colors.black54,
                          ),
                          Container(margin: EdgeInsets.only(left: 10.0)),
                          Text(
                            'Notification',
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.black87),
                          )
                        ],
                      ),
                      Switch(
                          value: switchValue,
                          onChanged: (bool? value) {
                            setState(() {
                              switchValue = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
            ),
            Container(
              height: 50.0,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 7.0),
              child: Row(
                children: <Widget>[
                  _verticalID(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Legal',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
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
                          padding:
                              EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.assignment, color: Colors.black54),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                ),
                                Text(
                                  'Terms of use',
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.black87),
                                )
                              ],
                            ),
                            onTap: () {
                              showdemodialog<DialogDemoAction>(
                                  context: context,
                                  child: AlertDialog(
                                    title: const Text('About us'),
                                    content: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: dialogTextstyle,
                                    ),
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
                        )
                      ],
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Card(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.privacy_tip, color: Colors.black54),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                ),
                                Text(
                                  'Privacy & Policy',
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.black87),
                                )
                              ],
                            ),
                            onTap: () {
                              showdemodialog<DialogDemoAction>(
                                  context: context,
                                  child: AlertDialog(
                                    title: const Text('Privacy & Policy'),
                                    content: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: dialogTextstyle,
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context,
                                                DialogDemoAction.agree);
                                          },
                                          child: const Text('Agree'))
                                    ],
                                  ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ))
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
            .showBottomSheet((context) => Text('You Selected: $value'));
      }
    });
  }

  _verticalID() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 07.0, bottom: 0.0),
      );
}

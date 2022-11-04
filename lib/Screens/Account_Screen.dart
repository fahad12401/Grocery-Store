import 'package:flutter/material.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  State<Account_Screen> createState() => account();
}

class account extends State<Account_Screen> {
  String username = 'FAHAD ALI KHAN';
  String mobilenumber = '03462039391';
  String email = 'fk6300244@gmail.com';
  @override
  Widget build(BuildContext context) {
    Icon ofericon = Icon(
      Icons.edit,
      color: Colors.black,
    );
    Icon Keyloch = Icon(
      Icons.vpn_key,
      color: Colors.black,
    );
    Icon clear = Icon(
      Icons.history,
      color: Colors.black,
    );
    Icon logout = Icon(
      Icons.do_not_disturb_on,
      color: Colors.black,
    );
    Icon menu = Icon(
      Icons.more_vert,
      color: Colors.black,
    );
    bool checkboxvalueA = true;
    bool checkboxvalueB = false;
    bool checkboxvalueC = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Account'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(7.0),
                alignment: Alignment.topCenter,
                height: 260,
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100.0,
                        margin: const EdgeInsets.all(10.0),
                        child:
                            ClipOval(child: Image.asset('assets/account.jpg')),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Change',
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.blueAccent),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                    side: BorderSide(color: Colors.blue)))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, top: 20.0, right: 5.0, bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  username,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  mobilenumber,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  email,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: null,
                              icon: ofericon,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                child: Text(
                  'Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Container(
                  height: 165.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 165.0,
                        width: 235.0,
                        margin: EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 12.0,
                                        right: 0.0,
                                        top: 5.0,
                                        bottom: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Uzair Ahmed',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          '66 defence Karachi',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'Watch',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'ID 12556',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            left: 0,
                                            right: 0,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Delivery Address',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              _verticalID(),
                                              Checkbox(
                                                  value: checkboxvalueA,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      checkboxvalueA = value!;
                                                    });
                                                  }),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  icon: menu,
                                  color: Colors.black,
                                  onPressed: null,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 235,
                        margin: EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 12.0,
                                          top: 5.0,
                                          right: 0,
                                          bottom: 5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Kasim sheikh',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5),
                                          ),
                                          Text(
                                            '4528 Fareed Street',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          Text(
                                            'Lamp',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          Text(
                                            ' PA 19103',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.0,
                                                letterSpacing: 0.5),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 00.0,
                                                top: 05.0,
                                                right: 0.0,
                                                bottom: 5.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Delivery Address',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                _verticalID(),
                                                Checkbox(
                                                    value: checkboxvalueB,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        checkboxvalueB = value!;
                                                      });
                                                    })
                                              ],
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  onPressed: null,
                                  icon: menu,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130.0,
                        width: 235.0,
                        margin: EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 12.0,
                                        top: 5.0,
                                        right: 0.0,
                                        bottom: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Furqan hadi',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          '33 Haekbay Karachi',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'Apple',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          'CA 90802',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 00.0,
                                              top: 05.0,
                                              right: 0.0,
                                              bottom: 5.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Delivery Address',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              _verticalID(),
                                              Checkbox(
                                                value: checkboxvalueC,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    checkboxvalueC = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    icon: menu,
                                    color: Colors.black38,
                                    onPressed: null),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(7.0),
                  child: Card(
                    elevation: 1.0,
                    child: Row(
                      children: <Widget>[
                        IconButton(onPressed: null, icon: Keyloch),
                        _verticalID(),
                        Text(
                          'Change Password',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(7.0),
                child: Card(
                  elevation: 1.0,
                  child: Row(
                    children: <Widget>[
                      IconButton(onPressed: null, icon: clear),
                      _verticalID(),
                      Text(
                        'Clear History',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(7.0),
                child: Card(
                  elevation: 1.0,
                  child: Row(
                    children: <Widget>[
                      IconButton(onPressed: null, icon: logout),
                      _verticalID(),
                      Text(
                        'Deacivate Account',
                        style: TextStyle(fontSize: 15.0, color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verticalID() => Container(
      margin: EdgeInsets.only(left: 3.0, top: 0.0, bottom: 0.0, right: 0.0));
}

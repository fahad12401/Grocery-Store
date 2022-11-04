import 'package:flutter/material.dart';

class OrderHitory extends StatefulWidget {
  const OrderHitory({Key? key}) : super(key: key);

  @override
  State<OrderHitory> createState() => History();
}

class items {
  final String name;
  final String deliverytime;
  final String orderId;
  final String orderAmount;
  final String PaymentType;
  final String address;
  final String cancelOrder;

  items(
      {required this.name,
      required this.deliverytime,
      required this.orderId,
      required this.orderAmount,
      required this.PaymentType,
      required this.address,
      required this.cancelOrder});
}

class History extends State<OrderHitory> {
  List list = ['11', '12'];
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  late VoidCallback _showbottomSheetCallback;
  List<items> itemlist = <items>[
    items(
        name: 'Uzair Ahmed',
        deliverytime: '12/03/2021',
        orderId: 'Bv32168',
        orderAmount: 'Rs.56300',
        PaymentType: 'online',
        address: 'Bahadurabad,Karachi',
        cancelOrder: 'cancelOrder'),
    items(
        name: 'Arhum Ali',
        deliverytime: '14/05/2021',
        orderId: 'BR33468',
        orderAmount: 'Rs.5400',
        PaymentType: 'COD',
        address: 'Defence,Karachi',
        cancelOrder: 'View Receipt'),
    items(
        name: 'Hassan Akram',
        deliverytime: '02/03/2021',
        orderId: 'BG232168',
        orderAmount: 'Rs.7800',
        PaymentType: 'COD',
        address: 'Nagan,Karachi',
        cancelOrder: 'View Receipt'),
    items(
        name: 'Furqan sheikh',
        deliverytime: '13/04/2022',
        orderId: 'BF223168',
        orderAmount: 'Rs.6890',
        PaymentType: 'Upi',
        address: 'Saddar,Karachi',
        cancelOrder: 'cancelOrder'),
    items(
        name: 'Ali Aziz',
        deliverytime: '30/01/2022',
        orderId: 'BT42168',
        orderAmount: 'Rs.12000',
        PaymentType: 'online',
        address: 'Korangi,Karachi',
        cancelOrder: 'View Receipt'),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Order History',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
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
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: itemlist.length,
          itemBuilder: (BuildContext cont, int ind) {
            return SafeArea(
                child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                  color: Colors.black12,
                  child: Card(
                    elevation: 4.0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: GestureDetector(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                itemlist[ind].name,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4.0),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'To Deliver On :' + itemlist[ind].deliverytime,
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.black54),
                              ),
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.amber.shade500,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(3.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Order ID :',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black54),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          itemlist[ind].orderId,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(3.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Amount',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black54),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          itemlist[ind].orderAmount,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(3.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Payment type',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black54),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          itemlist[ind].PaymentType,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.amber.shade500,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 20.0,
                                  color: Colors.redAccent,
                                ),
                                _verticalDivider(),
                                Text(
                                  itemlist[ind].address,
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.black54),
                                ),
                              ],
                            ),
                            Divider(
                              height: 20,
                              color: Colors.amber.shade500,
                            ),
                            Container(
                              child: _status(itemlist[ind].cancelOrder),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
          }),
    );
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(5.0),
      );

  Widget _status(status) {
    if (status == 'cancelOrder') {
      return TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.highlight_off,
            color: Colors.red,
          ),
          label: Text(
            status,
            style: TextStyle(color: Colors.red),
          ));
    } else {
      return TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          label: Text(
            status,
            style: TextStyle(color: Colors.green),
          ));
    }
  }
}

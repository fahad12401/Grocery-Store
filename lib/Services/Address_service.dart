import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shoppingapp/Models/Address_Model.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadProduct() async {
  return await rootBundle.loadString('asseets/address.json');
}

Future loadAddress() async {
  String jsonAddress = await _loadProduct();
  final jsonResponce = json.decode(jsonAddress);
  address address_model = new address.fromJson(jsonResponce);
}

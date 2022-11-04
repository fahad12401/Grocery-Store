class address {
  final int status;
  final int message;
  final List<Data> data;
  address({required this.data, required this.message, required this.status});
  factory address.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['images'] as List;
    print(list.runtimeType);
    List<Data> datalist = list.map((i) => Data.fromJson(i)).toList();
    return address(
        data: datalist,
        message: parsedJson['message'],
        status: parsedJson['status']);
  }
}

class Data {
  final int id;
  final String name;
  final String mobilenumber;
  final String address;
  final String district;
  final String state;
  final String pincode;
  Data(
      {required this.address,
      required this.district,
      required this.id,
      required this.mobilenumber,
      required this.name,
      required this.pincode,
      required this.state});
  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      id: parsedJson['id'],
      name: parsedJson['name'],
      mobilenumber: parsedJson['mobilenumber'],
      state: parsedJson['state'],
      pincode: parsedJson['pincode'],
      address: parsedJson['parsedJson'],
      district: parsedJson['district'],
    );
  }
}

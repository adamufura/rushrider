import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rushrider/Init.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getAllRiderOrders() async {
  final prefs = await SharedPreferences.getInstance();
  final String? response = prefs.getString('rush-rider');
  Map<dynamic, dynamic> result = jsonDecode(response!);
  String email = result['email'];
  String urlPost =
      Init.urlInit + "rider/orders.php?getAllRiderOrders=true&email=${email}";
  try {
    var response = await http.get(Uri.parse(urlPost));
    // print(response.body);
    return json.decode(response.body);
  } catch (e) {
    print(e);
  }
}

Future getAllRiderPENDINGOrders() async {
  final prefs = await SharedPreferences.getInstance();
  final String? response = prefs.getString('rush-rider');
  Map<dynamic, dynamic> result = jsonDecode(response!);
  String email = result['email'];
  String urlPost = Init.urlInit +
      "rider/orders.php?getAllRiderPENDINGOrders=true&email=${email}";
  try {
    var response = await http.get(Uri.parse(urlPost));
    // print(response.body);
    return json.decode(response.body);
  } catch (e) {
    print(e);
  }
}

Future getRiderOrderInfo(int id) async {
  String urlPost =
      Init.urlInit + "rider/orders.php?getRiderOrderInfo=true&id=${id}";
  try {
    var response = await http.get(Uri.parse(urlPost));
    // print(response.body);
    return json.decode(response.body);
  } catch (e) {
    print(e);
  }
}

Future setOrderStatus(int id, String status) async {
  String urlPost = Init.urlInit + "rider/orders.php";
  try {
    var res = await http.post(Uri.parse(urlPost), headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    }, body: {
      "id": id.toString(),
      "status": status,
      "setOrderStatus": 'true',
    });

    print(res.body);
    return json.decode(res.body);
  } catch (e) {
    print(e);
  }
}

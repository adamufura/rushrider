import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rushrider/Init.dart';

Future getAllRiderOrders(String email) async {
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

Future getAllRiderPENDINGOrders(String email) async {
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

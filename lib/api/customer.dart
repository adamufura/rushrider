import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rushrider/Init.dart';

Future<Response?> startTrackingOrder({
  required String email,
  required String trackingcode,
}) async {
  String urlPost = Init.urlInit + "customer/customer.php";
  try {
    var res = await http.post(Uri.parse(urlPost),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "tracking_code": trackingcode,
          "startTrackingOrder": "true",
        }));

    return res;
  } catch (e) {
    print(e);
  }
}

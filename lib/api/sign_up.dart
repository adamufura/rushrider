import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rushrider/Init.dart';

Future<Response?> signUp({
  required String fullname,
  required String email,
  required String phone,
  required String password,
}) async {
  String urlPost = Init.urlInit + "rider/sign_up.php";
  try {
    var res = await http.post(Uri.parse(urlPost), headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    }, body: {
      "fullname": fullname,
      "email": email,
      "phonenumber": phone,
      "password": password,
    });

    print(jsonDecode(res.body));

    return res;
  } catch (e) {
    print(e);
  }
}

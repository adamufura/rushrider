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
    var res = await http.post(
      Uri.parse(urlPost),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "fullname": fullname,
        "email": email,
        "phonenumber": phone,
        "password": password,
      }),
    );

    print("Raw response body: ${res.body}"); // Print raw response
    print("Response status: ${res.statusCode}"); // Print status code

    var decodedResponse = jsonDecode(res.body);
    print("Decoded response: $decodedResponse"); // Print decoded response

    return res;
  } catch (e) {
    print(e);
  }
}

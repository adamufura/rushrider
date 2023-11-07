import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rushrider/Init.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  Future getUser(String email) async {
    String urlPost = "${Init.urlInit}rider/user.php";
    try {
      var res = await http.post(Uri.parse(urlPost), headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }, body: {
        'email': email,
        'getUser': 'true'
      });
      if (res.statusCode == 200) {
        final result = jsonDecode(res.body);
        return result;
      }
    } catch (e) {
      print(e);
    }
  }

  getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final String? response = prefs.getString('rush-rider');
    Map<dynamic, dynamic> result = jsonDecode(response!);
    return result['email'];
  }
}

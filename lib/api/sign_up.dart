import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rushrider/api/init.dart';

Future<Response?> signUp({
  required String fullname,
  required String email,
  required String phone,
  required String password,
}) async {
  String urlPost = Init.urlInit + "user/sign_up.php";
  try {
    var res = await http.post(Uri.parse(urlPost), body: {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password,
    });

    return res;
  } catch (e) {
    print(e);
  }
}

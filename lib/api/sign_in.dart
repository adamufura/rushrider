import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rushrider/Init.dart';

Future<Response?> signIn({
  required String email,
  required String password,
}) async {
  String urlPost = Init.urlInit + "rider/sign_in.php";
  try {
    var res = await http.post(Uri.parse(urlPost), headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    }, body: {
      "email": email,
      "password": password,
    });

    return res;
  } catch (e) {
    print(e);
  }
}

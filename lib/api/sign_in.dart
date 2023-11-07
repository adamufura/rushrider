import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rushrider/api/init.dart';

Future<Response?> signIn({
  required String email,
  required String password,
}) async {
  String urlPost = Init.urlInit + "user/sign_in.php";
  try {
    var res = await http.post(Uri.parse(urlPost), body: {
      "email": email,
      "password": password,
    });

    return res;
  } catch (e) {
    print(e);
  }
}

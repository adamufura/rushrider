import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rushrider/api/sign_in.dart';
import 'package:rushrider/auth_screen.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/rider/home_screen.dart';
import 'package:rushrider/rider/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "/signInScreen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var isLoading = false;

  late TextEditingController emailTextController = TextEditingController();
  late TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                color: const Color(0xffECF2F3),
                height: SizeConfig.safeBlockVertical * 40,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 60, left: 30),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Rider',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 80,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailTextController,
                    decoration:
                        const InputDecoration(labelText: 'Email Address'),
                  ),
                  TextFormField(
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password')),
                  TextButton(
                    onPressed: () {},
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(SignUpScreen.routeName);
                                },
                                child: Text('here'))
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 5,
            ),
            const SizedBox(height: 10),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: SizeConfig.safeBlockHorizontal * 70,
              child: OutlinedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  // save
                  Response? res = await signIn(
                    email: emailTextController.text.trim(),
                    password: passwordTextController.text.trim(),
                  );
                  if (res!.statusCode == 200) {
                    Map<dynamic, dynamic> result = jsonDecode(res.body);
                    if (result.containsKey('error')) {
                      // show snackbar
                      SnackBar snackBar = SnackBar(
                        content: Text(result['error']),
                      );
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      if (result.containsKey('status')) {
                        // create user session
                        final prefs = await SharedPreferences.getInstance();

                        await prefs.setString(
                          'rush-rider',
                          jsonEncode({
                            'type': 'rider',
                            'email': result['email'],
                            'password': result['password']
                          }),
                        );

                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
                      }
                    }
                  }
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Icon(Icons.arrow_forward_outlined, color: Colors.white)
                    ]),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: BorderSide(
                      width: 1.5, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/customer/track_order_screen.dart';
import 'package:rushrider/rider/home_screen.dart';
import 'package:rushrider/rider/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

Future isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  final String? response = prefs.getString('rush-rider');
  return response;
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    isLoggedIn().then((value) {
      if (value.toString().isNotEmpty && value != null) {
        Map<dynamic, dynamic> result = jsonDecode(value);
        if (result['type'] == 'rider') {
          if (result.containsKey('email') && result.containsKey('password')) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
                color: const Color(0xffECF2F3),
                height: SizeConfig.safeBlockVertical * 35,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 60,
                    ),
                    child: SizedBox(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText(
                            'WELCOME TO RUSH RIDER',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Theme.of(context).primaryColor),
                          ),
                          RotateAnimatedText(
                            'Continue as RIDER',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Theme.of(context).primaryColor),
                          ),
                          RotateAnimatedText(
                            'Continue as CUSTOMER',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                        onTap: () {
                          // print("Tap Event");
                        },
                      ),
                    ),
                  ),
                )),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 80,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignInScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Rider',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ]),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(TrackOrderScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Customer (Track Orders)',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ]),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(),
          Container()
        ],
      )),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path0 = Path();

    path0.moveTo(size.width * 0.0033333, size.height * 0.0071429);
    path0.lineTo(size.width * 0.0041667, size.height * 0.6371429);
    path0.quadraticBezierTo(size.width * 0.1552167, size.height * 1.0059286,
        size.width * 0.2688750, size.height * 0.9837571);
    path0.quadraticBezierTo(size.width * 0.4965500, size.height * 0.8735286,
        size.width * 0.9966667, size.height * 0.6400000);
    path0.lineTo(size.width * 0.9975000, size.height * 0.0057143);
    path0.lineTo(size.width * 0.0033333, size.height * 0.0071429);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

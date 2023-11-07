import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:rushrider/auth_screen.dart';
import 'package:rushrider/configs/SizeConfig.dart';

class RushRiderSplashScreen extends StatefulWidget {
  const RushRiderSplashScreen({super.key});

  @override
  State<RushRiderSplashScreen> createState() => _RushRiderSplashScreenState();
}

class _RushRiderSplashScreenState extends State<RushRiderSplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterSplashScreen.gif(
              backgroundColor: Colors.white,
              gifPath: 'assets/images/rider.gif',
              gifWidth: SizeConfig.blockSizeHorizontal * 80,
              gifHeight: SizeConfig.blockSizeVertical * 70,
              nextScreen: const AuthScreen(),
              duration: const Duration(milliseconds: 5000),
              onInit: () async {
                // debugPrint("onInit");
              },
              onEnd: () async {
                // debugPrint("onEnd 1");
              },
            ),
            Positioned(
              top: SizeConfig.safeBlockVertical * 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'RUSH RIDER',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

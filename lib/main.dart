import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rushrider/RushRiderSplashScreen.dart';
import 'package:rushrider/configs/palette.dart';
import 'package:rushrider/customer/track_order_screen.dart';
import 'package:rushrider/rider/all_deliveries.dart';
import 'package:rushrider/rider/home_screen.dart';
import 'package:rushrider/rider/order_info_screen.dart';
import 'package:rushrider/rider/requests_screen.dart';
import 'package:rushrider/rider/sign_in_screen.dart';
import 'package:rushrider/rider/sign_up_screen.dart';

void main(List<String> args) {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const RushRider());
}

class RushRider extends StatelessWidget {
  const RushRider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Palette.rushRiderTheme),
      title: "RUSH RIDER",
      home: const RushRiderSplashScreen(),
      routes: {
        // App

        // Rider
        SignInScreen.routeName: (ctx) => const SignInScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        RequestScreen.routeName: (ctx) => const RequestScreen(),
        OrderInfoScreen.routeName: (ctx) => const OrderInfoScreen(),
        AllDeliveries.routeName: (ctx) => const AllDeliveries(),
        // Customer
        TrackOrderScreen.routeName: (ctx) => const TrackOrderScreen()
      },
    );
  }
}

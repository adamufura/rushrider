import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rushrider/RushRiderSplashScreen.dart';
import 'package:rushrider/configs/palette.dart';
import 'package:rushrider/customer/customer_status_screen.dart';
import 'package:rushrider/customer/track_order_screen.dart';
import 'package:rushrider/providers/user_provider.dart';
import 'package:rushrider/rider/all_deliveries.dart';
import 'package:rushrider/rider/home_screen.dart';
import 'package:rushrider/rider/iniate_delivery.dart';
import 'package:rushrider/rider/order_info_screen.dart';
import 'package:rushrider/rider/requests_screen.dart';
import 'package:rushrider/rider/sign_in_screen.dart';
import 'package:rushrider/rider/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main(List<String> args) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const RushRider());
}

class RushRider extends StatelessWidget {
  const RushRider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
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
          InitiateDelivery.routeName: (ctx) => const InitiateDelivery(),
          // Customer
          TrackOrderScreen.routeName: (ctx) => const TrackOrderScreen(),
          CustomerStatusScreen.routeName: (ctx) => const CustomerStatusScreen(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: "RUSH RIDER",
      home: Container(),
      routes: {
        // App

        // Rider

        // User
      },
    );
  }
}

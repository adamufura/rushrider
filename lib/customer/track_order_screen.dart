import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rushrider/api/customer.dart';
import 'package:rushrider/auth_screen.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/customer/customer_status_screen.dart';

class TrackOrderScreen extends StatefulWidget {
  static const routeName = "/trackOrdercreen";
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  var isLoading = false;

  late TextEditingController emailTextController = TextEditingController();
  late TextEditingController trackingCodeTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // MZBXYQ

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
                        'Track Your Order',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Customer',
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
                      controller: trackingCodeTextController,
                      decoration:
                          const InputDecoration(labelText: 'Tracking Code')),
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
                  Response? res = await startTrackingOrder(
                    email: emailTextController.text.trim(),
                    trackingcode: trackingCodeTextController.text.trim(),
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
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context).pushReplacementNamed(
                            CustomerStatusScreen.routeName,
                            arguments: {
                              'email': result['email'],
                              'tracking_code': result['tracking_code'],
                            });
                      }
                    }
                  }
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start Tracking...',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Icon(Icons.bike_scooter, color: Colors.white)
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

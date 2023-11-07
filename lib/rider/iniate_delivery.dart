import 'package:flutter/material.dart';
import 'package:rushrider/api/order.dart';

class InitiateDelivery extends StatefulWidget {
  static const routeName = "/initiateDeliveryScreen";

  const InitiateDelivery({super.key});

  @override
  State<InitiateDelivery> createState() => _InitiateDeliveryState();
}

class _InitiateDeliveryState extends State<InitiateDelivery> {
  final TextEditingController locationController = TextEditingController();
  String currentLocation = '';

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    int orderID = arguments['orderID'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Enter Your Current Location',
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                setState(() {
                  currentLocation = locationController.text;
                });
                await setOrderLocation(orderID, currentLocation);
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Text(
              'Current Location: $currentLocation',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }
}

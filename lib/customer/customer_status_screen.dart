import 'package:flutter/material.dart';
import 'package:rushrider/api/order.dart';

class CustomerStatusScreen extends StatefulWidget {
  static const routeName = "/customerStatusScreen";

  const CustomerStatusScreen({super.key});

  @override
  State<CustomerStatusScreen> createState() => _CustomerStatusScreenState();
}

class _CustomerStatusScreenState extends State<CustomerStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Status"),
      ),
      body: FutureBuilder(
          future: getRiderOrderInfo(1),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Order Information'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CardInfo(
                            title: "Order ID",
                            content: "#${1}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Order Title",
                            content: "${snapshot.data['data']['title']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Order Description",
                            content: "${snapshot.data['data']['description']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Order Status",
                            content: "${snapshot.data['data']['status']}",
                          ),
                          Divider(thickness: 1.5),
                        ],
                      ),
                    ),
                  ),
                  Text('Rider Information'),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CardInfo(
                            title: "Rider Email",
                            content: "${snapshot.data['data']['rider_email']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Rider Name",
                            content: "${snapshot.data['data']['fullname']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Customer Phone",
                            content: "${snapshot.data['data']['phonenumber']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Rider Current Location",
                            content:
                                "${snapshot.data['data']['current_location']}",
                          ),
                          Divider(thickness: 1.5),
                        ],
                      ),
                    ),
                  ),
                  Text('Business Information'),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CardInfo(
                            title: "Business Email",
                            content:
                                "${snapshot.data['data']['businessEmail']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Business Address",
                            content:
                                "${snapshot.data['data']['business_address']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Business Name",
                            content:
                                "${snapshot.data['data']['business_name']}",
                          ),
                          Divider(thickness: 1.5),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () async {
                              await setOrderStatus(1, 'DELIVERED');
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'ORDER DELIVERED',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.accessible_sharp,
                                      color: Colors.white)
                                ]),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              side: BorderSide(
                                  width: 1.5,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class CardInfo extends StatelessWidget {
  String title;
  String content;
  CardInfo({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${title}:',
              style: TextStyle(
                  fontSize: 22, color: Theme.of(context).primaryColor),
            ),
          ),
          Text(
            content,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

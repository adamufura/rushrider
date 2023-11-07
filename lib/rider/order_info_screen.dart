import 'package:flutter/material.dart';
import 'package:rushrider/api/order.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/widgets/RiderDrawer.dart';
import 'package:rushrider/widgets/app_bar.dart';

class OrderInfoScreen extends StatefulWidget {
  static const routeName = "/orderInfoScreen";
  const OrderInfoScreen({super.key});

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    int orderID = arguments['orderID'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Information'),
      ),
      body: FutureBuilder(
          future: getRiderOrderInfo(orderID),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Order Information'),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CardInfo(
                            title: "Order ID",
                            content: "#${orderID}",
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
                ),
                Text('Customer Information'),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CardInfo(
                            title: "Customer Email",
                            content:
                                "${snapshot.data['data']['customerEmail']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Customer Name",
                            content:
                                "${snapshot.data['data']['customer_fullname']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Customer Phone",
                            content:
                                "${snapshot.data['data']['customer_phonenumber']}",
                          ),
                          Divider(thickness: 1.5),
                          CardInfo(
                            title: "Customer Destination",
                            content:
                                "${snapshot.data['data']['customer_address']}",
                          ),
                          Divider(thickness: 1.5),
                        ],
                      ),
                    ),
                  ),
                ),
                Text('Business Information'),
                Expanded(
                  child: Container(
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
                ),
                snapshot.data['data']['status'] == 'PENDING'
                    ? Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () async {
                                await setOrderStatus(orderID, 'ACCEPTED');
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Accept',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.mark_chat_read_outlined,
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
                            OutlinedButton(
                              onPressed: () async {
                                await setOrderStatus(orderID, 'DECLINED');
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Decline',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.cancel, color: Colors.white)
                                  ]),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Theme.of(context).errorColor,
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                side: BorderSide(
                                    width: 1.5,
                                    color: Theme.of(context).errorColor),
                              ),
                            ),
                          ],
                        ))
                    : snapshot.data['data']['status'] == 'ACCEPTED'
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text('Iniate Delivery'),
                              ),
                            ),
                          )
                        : Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'ORDER WAS DECLINED',
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                            ),
                          ),
              ],
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
